//
//  JCRecommendViewController.m
//  百思
//
//  Created by mr.w on 16/5/7.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCRecommendViewController.h"

#import "JCRecommendCategoryCell.h"
#import "JCRecommandCategory.h"
#import "JCRecommendUserCell.h"
#import "JCRecommandUser.h"
#import <MJExtension.h>
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJRefresh.h>
#define JCSelectCategory self.categorys[self.tagTableView.indexPathForSelectedRow.row]
@interface JCRecommendViewController ()<UITableViewDataSource,UITableViewDelegate>
/**左边的类别数据*/
@property(nonatomic,strong)NSArray *categorys;
/**右边用户数据*/
//@property(nonatomic,strong)NSArray *users;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (weak, nonatomic) IBOutlet UITableView *tagTableView;

/**请求参数*/
@property(nonatomic,strong)NSMutableDictionary  *params;
/**<#注释#>*/
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@end


@implementation JCRecommendViewController
static NSString * const categoryID=@"category";
static NSString * const userID=@"user";
-(AFHTTPSessionManager *)manager{
    if(_manager==nil){
        _manager=[AFHTTPSessionManager manager];
    }
    return _manager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpTable];
    
    [self loadCategory];
    
    [self setUpRefresh];
   
}
/**
 *  tableView初始化
 */
-(void)setUpTable{
    //注册
    [self.tagTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JCRecommendCategoryCell class]) bundle:nil]forCellReuseIdentifier:categoryID];
    
    [self.detailTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JCRecommendUserCell class]) bundle:nil]forCellReuseIdentifier:userID];
    //
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.tagTableView.contentInset=UIEdgeInsetsMake(60, 0, 60, 0);
    self.detailTableView.contentInset=self.tagTableView.contentInset;
    self.detailTableView.rowHeight=60;
    
    //设置标题
    self.title=@"推荐关注";
    
    self.detailTableView.backgroundColor=JCGlobalBg;
    self.tagTableView.backgroundColor=JCGlobalBg;
}
/**
 *  设置刷新控件
 */
-(void)setUpRefresh{
    //设置尾部
    self.detailTableView.mj_footer= [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    
    self.detailTableView.mj_footer.hidden=YES;
    
    self.detailTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
}
#pragma mark-加载左侧类别数据
-(void)loadCategory{
    //显示指示器
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    //    发送请求
    NSMutableDictionary *parameter=[NSMutableDictionary dictionary];
    parameter[@"a"]=@"category";
    parameter[@"c"]=@"subscribe";
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        //JCLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //隐藏指示器
        [SVProgressHUD dismiss];
        //服务器返回的json数据
        //JCLog(@"请求成功---%@", responseObject[@"list"]);
        //存储服务器返回的json数据
        self.categorys=[JCRecommandCategory mj_objectArrayWithKeyValuesArray:
                        responseObject[@"list"]];
        
        //reloadData
        [self.tagTableView reloadData];
        
        [self.tagTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        
        [self loadNewUsers];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败"];
    }];

}

#pragma  mark-加载用户数据
-(void)loadNewUsers{
     JCRecommandCategory *category=JCSelectCategory;

    category.currentPage=1;
    
    NSMutableDictionary *parameter=[NSMutableDictionary dictionary];
    parameter[@"a"]=@"list";
    parameter[@"c"]=@"subscribe";
    parameter[@"category_id"]=@(category.id);
    parameter[@"page"]=@(category.currentPage);
    
    self.params=parameter;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        //数组转模型
        [category.users removeAllObjects];
        NSArray *userArray=[JCRecommandUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //添加当前类别对应的用户数组中
        [category.users addObjectsFromArray:userArray];
        //保存总数
        category.total=[responseObject[@"total"] integerValue];
        
        if(self.params!=parameter) return;
        //刷新表格
        [self.detailTableView reloadData];
        
        JCLog(@"%ld",category.users.count);
        JCLog(@"%ld",category.total);
        //结束刷新
        [self.detailTableView.mj_header endRefreshing];
        //检查footerView的状态
        [self checkFooterViewState];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(self.params!=parameter) return;
        //结束刷新
        [self.detailTableView.mj_header endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
    }];

}
//上拉刷新
-(void)loadMoreUsers{
    JCLogFun;
    JCRecommandCategory *category=JCSelectCategory;
    JCLog(@"%ld",category.users.count);
    JCLog(@"%ld",category.total);
    //封装请求
    NSMutableDictionary *parameter=[NSMutableDictionary dictionary];
    parameter[@"a"]=@"list";
    parameter[@"c"]=@"subscribe";
    parameter[@"category_id"]=@(category.id);
    parameter[@"page"]=@(++category.currentPage);
    
     self.params=parameter;
    //发出请求
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        //数组转模型
        NSArray *userArray=[JCRecommandUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //添加当前类别对应的用户数组中
        [category.users addObjectsFromArray:userArray];
        
        
        if(self.params!=parameter) return;
        
        [self.detailTableView reloadData];
        
        //        [self.detailTableView.mj_footer endRefreshing];
        
        //检查footerView的状态
        [self checkFooterViewState];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(self.params!=parameter) return;
        NSLog(@"%@",error);
    }];
}

-(void)checkFooterViewState{
    JCRecommandCategory *category=JCSelectCategory;
    NSInteger count=[JCSelectCategory users].count;
    self.detailTableView.mj_footer.hidden=(count==0);
    if(category.users.count==category.total){
        [self.detailTableView.mj_footer endRefreshingWithNoMoreData];
        JCLog(@"-----");
    }else{
        [self.detailTableView.mj_footer endRefreshing];
    }
}

#pragma mark --<UITableViewDataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    if(tableView==self.tagTableView){
       return  self.categorys.count;
    }else{//刷新右边用户表格
        //检测footerView状态
        [self checkFooterViewState];
        return  [JCSelectCategory users].count;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView==self.tagTableView){
    JCRecommendCategoryCell *cell=[tableView dequeueReusableCellWithIdentifier:categoryID];
    
    cell.category=self.categorys[indexPath.row];
    return cell;
    }else{
        JCRecommendUserCell *cell=[tableView dequeueReusableCellWithIdentifier:userID];
        JCRecommandCategory *category=self.categorys[self.tagTableView.indexPathForSelectedRow.row];
        cell.user=category.users[indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //如果有用户缓存
        if([JCSelectCategory users].count){
            [self.detailTableView reloadData];
        }else{
            //刷新表格，目的是当网络卡的时候，不让用户看到其他类别的用户数据
            [self.detailTableView reloadData];
            //进入下拉刷新状态
            [self.detailTableView.mj_header beginRefreshing];
        }
}
#pragma mark--控制器的销毁
-(void)dealloc{
    [self.manager.operationQueue cancelAllOperations];
}
@end

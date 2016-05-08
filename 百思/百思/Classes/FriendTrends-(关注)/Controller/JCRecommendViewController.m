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
@interface JCRecommendViewController ()<UITableViewDataSource,UITableViewDelegate>
/**左边的类别数据*/
@property(nonatomic,strong)NSArray *categorys;
/**右边用户数据*/
@property(nonatomic,strong)NSArray *users;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (weak, nonatomic) IBOutlet UITableView *tagTableView;
@end


@implementation
JCRecommendViewController
static NSString * const categoryID=@"category";
static NSString * const userID=@"user";
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpTable];
    
    //显示指示器
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    //
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
//    发送请求
    NSMutableDictionary *parameter=[NSMutableDictionary dictionary];
    parameter[@"a"]=@"category";
    parameter[@"c"]=@"subscribe";
    
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        JCLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //隐藏指示器
        [SVProgressHUD dismiss];
        //服务器返回的json数据
         JCLog(@"请求成功---%@", responseObject[@"list"]);
        //存储服务器返回的json数据
        self.categorys=[JCRecommandCategory mj_objectArrayWithKeyValuesArray:
        responseObject[@"list"]];
        
        //reloadData
        [self.tagTableView reloadData];
        
        [self.tagTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败"];
    }];
}

/**
 *  tableView初始化
 */
-(void)setUpTable{
    //注册
    [self.tagTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JCRecommendCategoryCell class]) bundle:nil]forCellReuseIdentifier:categoryID];
    
    [self.detailTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JCRecommendUserCell class]) bundle:nil]forCellReuseIdentifier:userID];
    
    self.detailTableView.rowHeight=60;
}
/**
 *  设置刷新控件
 */
//-(void)setUpRefresh{
//    self.detailTableView.mj_footer=[MJRefreshFooter ]
//}
#pragma mark --<UITableViewDataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView==self.tagTableView){
       return  self.categorys.count;
    }else{
        return  self.users.count;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView==self.tagTableView){
    JCRecommendCategoryCell *cell=[tableView dequeueReusableCellWithIdentifier:categoryID];
    
    cell.category=self.categorys[indexPath.row];
    return cell;
    }else{
        JCRecommendUserCell *cell=[tableView dequeueReusableCellWithIdentifier:userID];
        
        cell.user=self.users[indexPath.row];
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JCRecommandCategory *category=self.categorys[indexPath.row];
    
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=@"list";
    parameters[@"c"]=@"subscribe";
    parameters[@"category_id"]=@(category.id);

    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.users=[JCRecommandUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.detailTableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end

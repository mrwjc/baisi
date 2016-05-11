//
//  JCRecommendTagsViewController.m
//  百思
//
//  Created by mr.w on 16/5/11.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCRecommendTagsViewController.h"
#import <SVProgressHUD.h>
#import <AFNetworking.h>
#import <MJExtension.h>
#import "JCTag.h"
#import "JCTagCell.h"
@interface JCRecommendTagsViewController ()
/**<#注释#>*/
@property(nonatomic,strong)NSArray *tags;
@end

@implementation JCRecommendTagsViewController
NSString * const tagID=@"tag";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"推荐标签";
    
    [self setUpTableView];
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD show];
    //封装参数
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=@"tag_recommend";
    parameters[@"action"]=@"sub";
    parameters[@"c"]=@"topic";
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];

        self.tags=[JCTag mj_objectArrayWithKeyValuesArray:responseObject];


        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载推荐标签失败"];
    }];
}

-(void)setUpTableView{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JCTagCell class]) bundle:nil] forCellReuseIdentifier:tagID];
    
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor=JCGlobalBg;
}
#pragma mark - Table view data source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTagCell *cell = [tableView dequeueReusableCellWithIdentifier:tagID];
    
    cell.tags=self.tags[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

@end

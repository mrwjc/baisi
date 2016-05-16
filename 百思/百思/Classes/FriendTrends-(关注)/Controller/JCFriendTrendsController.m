//
//  JCFriendTrendsController.m
//  百思
//
//  Created by mr.w on 16/5/6.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCFriendTrendsController.h"
#import "UIBarButtonItem+JCNavigationItem.h"
#import <AFNetworking.h>
#import "JCRecommendViewController.h"
#import "JCLoginController.h"
@interface JCFriendTrendsController ()

@end

@implementation JCFriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
    
    self.view.backgroundColor=JCGlobalBg;
}

-(void)setNav{
    self.navigationItem.title=@"我的关注";
    
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] SelectImg:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(add)];
}
-(void)add{
    [self.navigationController pushViewController:[[JCRecommendViewController alloc]init] animated:YES];
    
}
- (IBAction)login:(id)sender {
    [self presentViewController:[[JCLoginController alloc]init] animated:YES completion:^{
        self.tabBarController.hidesBottomBarWhenPushed=YES;
    }];
}
@end

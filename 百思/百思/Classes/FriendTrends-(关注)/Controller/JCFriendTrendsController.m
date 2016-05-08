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
@interface JCFriendTrendsController ()

@end

@implementation JCFriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
    
    
}

-(void)setNav{
    self.navigationItem.title=@"我的关注";
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] SelectImg:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(add)];
}
-(void)add{
    [self.navigationController pushViewController:[[JCRecommendViewController alloc]init] animated:YES];
}
@end

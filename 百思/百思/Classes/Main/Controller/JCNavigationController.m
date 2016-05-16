//
//  JCNavigationController.m
//  百思
//
//  Created by mr.w on 16/5/6.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCNavigationController.h"

@interface JCNavigationController ()

@end

@implementation JCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navBar=[UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    JCLog(@"%ld",self.childViewControllers.count);
    if(self.childViewControllers.count>0){
        UIButton *button=[UIButton buttonWithType:UIButtonTypeContactAdd];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        //将按钮往左移动
        button.contentEdgeInsets=UIEdgeInsetsMake(0, -30, 0, 0);
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        button.size=CGSizeMake(60, 44);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:button];
         viewController.hidesBottomBarWhenPushed=YES;
    }
   
    [super pushViewController:viewController animated:animated];
}
-(void)back{
    [self popViewControllerAnimated:YES];
}
@end

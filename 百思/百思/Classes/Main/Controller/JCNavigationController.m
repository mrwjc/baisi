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

@end

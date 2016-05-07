//
//  JCMeViewController.m
//  百思
//
//  Created by mr.w on 16/5/6.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCMeViewController.h"
#import "UIBarButtonItem+JCNavigationItem.h"
@interface JCMeViewController ()

@end

@implementation JCMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
}
-(void)setNav{
    self.navigationItem.title=@"我的";
    
    self.navigationItem.rightBarButtonItems=@[
                                              [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] SelectImg:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting)],
                                              [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] SelectImg:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(night)]
                                              ];
}
-(void)setting
{
    
}
-(void)night{
    
}
@end

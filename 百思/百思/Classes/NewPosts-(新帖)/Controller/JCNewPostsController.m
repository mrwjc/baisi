//
//  JCNewPostsController.m
//  百思
//
//  Created by mr.w on 16/5/6.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCNewPostsController.h"
#import "UIBarButtonItem+JCNavigationItem.h"
@interface JCNewPostsController ()

@end

@implementation JCNewPostsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
    
    self.view.backgroundColor=JCColor;
}

-(void)setUpNav{
    
    
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] SelectImg:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(btnClick)];
}

-(void)btnClick{
    
}

@end

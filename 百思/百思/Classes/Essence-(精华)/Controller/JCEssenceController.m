//
//  JCEssenceController.m
//  百思
//
//  Created by mr.w on 16/5/6.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCEssenceController.h"
#import "UIBarButtonItem+JCNavigationItem.h"
#import "JCRecommendTagsViewController.h"
@interface JCEssenceController ()

@end

@implementation JCEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpNav];
    
}

-(void)setUpNav{
  
    
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] SelectImg:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(btnClick)];
    
}

-(void)btnClick{
    JCRecommendTagsViewController *tags=[[JCRecommendTagsViewController alloc]init];
    
    [self.navigationController pushViewController:tags animated:YES];
}


@end

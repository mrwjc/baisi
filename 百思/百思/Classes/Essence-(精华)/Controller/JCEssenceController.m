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
/**选中的标签按钮*/
@property(nonatomic,strong)UIButton *selectBtn;
/**标签下方的指示器*/
@property(nonatomic,strong)UIView *indecatorView;
@end

@implementation JCEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpNav];
    
    [self setUpTitleView];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=JCGlobalBg;
}
/**
 *  设置标题栏
 */
-(void)setUpTitleView{
    //设置标题栏
    UIView *titleView=[[UIView alloc]init];
    titleView.frame=CGRectMake(0, 64, self.view.width, 35);
    titleView.backgroundColor=[UIColor colorWithWhite:1 alpha:0.5];
    
    [self.view addSubview:titleView];
    
    //设置标签按钮下面的指示器
    UIView *indecatorView=[[UIView alloc]init];
    indecatorView.height=2;
    indecatorView.backgroundColor=[UIColor redColor];
    indecatorView.y=titleView.height-indecatorView.height;
    [titleView addSubview:indecatorView];
    
    self.indecatorView=indecatorView;
    
    //设置标题按钮
    NSArray *btnArray=@[@"全部",@"视频",@"图片",@"段子",@"声音"];
    CGFloat btnW=titleView.width/btnArray.count;
    CGFloat btnX;
    CGFloat btnY=0;
    CGFloat btnH=titleView.height;
    for(int i=0;i<btnArray.count;i++){
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        btnX=i*btnW;
        button.frame=CGRectMake(btnX, btnY, btnW, btnH);
        [button setTitle:btnArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
         [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [button addTarget:self action:@selector(titleSelect:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font=[UIFont systemFontOfSize:15];
        [titleView addSubview:button];
        
        if(i==0){
            button.enabled = NO;
            self.selectBtn = button;
            
            // 让按钮内部的label根据文字内容来计算尺寸
            [button.titleLabel sizeToFit];
            self.indecatorView.width = button.titleLabel.width;
            self.indecatorView.centerX = button.centerX;
        }
    }
  
    
}
/**
 *  设置导航栏
 */
-(void)setUpNav{
  
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] SelectImg:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(btnClick)];
    
}

-(void)titleSelect:(UIButton *)button{
    button.enabled=NO;
    self.selectBtn.enabled=YES;
    self.selectBtn=button;
    [UIView animateWithDuration:0.25 animations:^{
        self.indecatorView.centerX=button.centerX;
        self.indecatorView.width=button.titleLabel.width;
    }];
}
-(void)btnClick{
    JCRecommendTagsViewController *tags=[[JCRecommendTagsViewController alloc]init];
    
    [self.navigationController pushViewController:tags animated:YES];
}


@end

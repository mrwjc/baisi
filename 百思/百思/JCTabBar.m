//
//  JCTabBar.m
//  百思
//
//  Created by mr.w on 16/5/5.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCTabBar.h"
@interface JCTabBar()
/**<#注释#>*/
@property(nonatomic,weak)UIButton *publishBtn;
@end
@implementation JCTabBar
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        //设置tabBar背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        
        UIButton *publishBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];

        publishBtn.size=publishBtn.currentBackgroundImage.size;
        
        
        [self addSubview:publishBtn];
        self.publishBtn=publishBtn;
    }
    return self;
}

-(void)layoutSubviews{
    //设置添加按钮的frame
    self.publishBtn.center=CGPointMake(self.width*0.5, self.height*0.5);
    
    CGFloat btnW=self.width/5;
    CGFloat btnH=self.height;
    CGFloat btnX=0;
    CGFloat btnY=0;
    //按钮索引
    NSInteger index=0;
    for (UIView *item in self.subviews) {
        
        if(![item isKindOfClass:[UIControl class]]||item==self.publishBtn) return ;
        btnX=btnW*((index>1)?(index+1):index);
        item.frame=CGRectMake(btnX, btnY, btnW, btnH);
        index++;
    }
    
}
@end

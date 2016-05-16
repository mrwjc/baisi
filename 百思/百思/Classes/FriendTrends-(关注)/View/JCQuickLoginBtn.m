//
//  JCQuickLoginBtn.m
//  百思
//
//  Created by mr.w on 16/5/14.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCQuickLoginBtn.h"

@implementation JCQuickLoginBtn

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    self.imageView.frame=CGRectMake(0, 0, self.width, self.width);
    
    self.titleLabel.frame=CGRectMake(0, self.width, self.width, self.height-self.width);
    
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
}

@end

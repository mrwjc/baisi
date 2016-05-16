//
//  JCLoginBtn.m
//  百思
//
//  Created by mr.w on 16/5/15.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCLoginBtn.h"

@implementation JCLoginBtn

-(void)awakeFromNib{
    UIImage *image=[UIImage imageNamed:@"loginBtnBg"];
    image=[image stretchableImageWithLeftCapWidth:0.5 topCapHeight:0.5];
    [self setBackgroundImage:image forState:UIControlStateNormal];
    
    UIImage *selImage=[UIImage imageNamed:@"loginBtnBgClick"];
    selImage=[selImage stretchableImageWithLeftCapWidth:0.5 topCapHeight:0.5];
    [self setBackgroundImage:selImage forState:UIControlStateHighlighted];
    
}
@end

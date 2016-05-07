//
//  UIBarButtonItem+JCNavigationItem.m
//  百思
//
//  Created by mr.w on 16/5/7.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "UIBarButtonItem+JCNavigationItem.h"

@implementation UIBarButtonItem (JCNavigationItem)
+(instancetype)itemWithImage:(UIImage *)image SelectImg:(UIImage *)selImage target:(id)target action:(SEL)action{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:selImage forState:UIControlStateHighlighted];
    button.size=button.currentBackgroundImage.size;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc]initWithCustomView:button];
}
@end

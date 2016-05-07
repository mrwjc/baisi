//
//  UIBarButtonItem+JCNavigationItem.h
//  百思
//
//  Created by mr.w on 16/5/7.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JCNavigationItem)
+(instancetype)itemWithImage:(UIImage *)image SelectImg:(UIImage *)image target:(nullable id)target action:(nullable SEL)action;
@end

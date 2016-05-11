//
//  JCTag.h
//  百思
//
//  Created by mr.w on 16/5/11.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCTag : NSObject
/**头像*/
@property(nonatomic,copy)NSString *image_list;
/**标签名称*/
@property(nonatomic,copy)NSString *theme_name;
/**订阅量*/
@property(nonatomic,assign)NSInteger sub_number;
@end

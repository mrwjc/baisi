//
//  JCRecommandUser.h
//  百思
//
//  Created by mr.w on 16/5/8.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCRecommandUser : NSObject
/**用户名*/
@property(nonatomic,copy)NSString *screen_name;
/**粉丝数量*/
@property(nonatomic,assign)NSInteger fans_count;
/**头像*/
@property(nonatomic,copy)NSString *header;


@end

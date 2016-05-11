//
//  JCCategory.m
//  百思
//
//  Created by mr.w on 16/5/7.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCRecommandCategory.h"

@implementation JCRecommandCategory
-(NSMutableArray *)users{
    if(_users==nil){
        _users=[NSMutableArray array];
    }
    return _users;
}
@end

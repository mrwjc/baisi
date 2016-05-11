//
//  JCCategory.h
//  百思
//
//  Created by mr.w on 16/5/7.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCRecommandCategory : NSObject

/**总数*/
@property(nonatomic,assign)NSInteger count;
/**id*/
@property(nonatomic,assign)NSInteger id;
/**名字*/
@property(nonatomic,copy)NSString *name;


/**该类别下总共用户数*/
@property(nonatomic,assign)NSInteger total;

/** 当前页码 */
@property (nonatomic, assign) NSInteger currentPage;

/**这个类别对应的用户数据*/
@property(nonatomic,strong)NSMutableArray *users;
@end

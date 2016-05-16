//
//  JCPushView.m
//  百思
//
//  Created by mr.w on 16/5/16.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCPushView.h"

@implementation JCPushView

+(void)show{
    //
    NSString *versionKey=@"CFBundleShortVersionString";
    //取出当前的版本号
    NSString *currentVersion=[NSBundle mainBundle].infoDictionary[versionKey];
    //获得沙盒中存储的版本号
    NSString *samboxVersion=[[NSUserDefaults standardUserDefaults] stringForKey:versionKey];
    
    if(![currentVersion isEqualToString:samboxVersion]){
        UIWindow *window=[UIApplication sharedApplication].keyWindow;
        JCPushView *pushView=[JCPushView pushGuide];
        
        pushView.bounds=window.bounds;
        NSLog(@"%@",NSStringFromCGRect(pushView.bounds));
        [window addSubview:pushView];
        //存储版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:versionKey];
    }
}

+(instancetype)pushGuide{
    return  [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
//关闭界面
- (IBAction)dismiss:(id)sender {
    [self removeFromSuperview];
}


@end

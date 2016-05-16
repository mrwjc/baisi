//
//  JCTextField.m
//  百思
//
//  Created by mr.w on 16/5/15.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCTextField.h"
#import <objc/runtime.h>
@implementation JCTextField
+(void)initialize{
    //    unsigned int count=0;
    //    Ivar *ivars=class_copyIvarList([UITextField class], &count);
    //
    //    for(int i=0;i<count;i++){
    //        //取出成员变量
    //        Ivar ivar=*(ivars+i);
    //
    //        NSLog(@"%s---%s",ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    //
    //
    //    }
    //    //释放
    //    free(ivars);
}

-(void)awakeFromNib{
    
    UILabel *plcaeLabel=[self valueForKeyPath:@"_placeholderLabel"];
    plcaeLabel.textColor=[UIColor grayColor];
    
    self.tintColor=self.textColor;

}
/**
 *  当前文本框聚焦时
 *
 *  @return <#return value description#>
 */
-(BOOL)becomeFirstResponder{
    [self setValue:self.textColor forKeyPath:@"_placeholderLabel.textColor"];
    return [super becomeFirstResponder];
}
/**
 *  当前文本框失去焦点时
 *
 *  @return <#return value description#>
 */
-(BOOL)resignFirstResponder{
     [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    return [super resignFirstResponder];
}
@end

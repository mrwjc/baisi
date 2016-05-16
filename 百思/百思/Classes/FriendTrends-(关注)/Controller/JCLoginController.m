//
//  JCLoginController.m
//  百思
//
//  Created by mr.w on 16/5/12.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCLoginController.h"
@interface JCLoginController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginConstraint;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation JCLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.view endEditing:YES];
}
- (IBAction)logon:(id)sender {
    [self.view endEditing:YES];
    if(self.loginConstraint.constant==0){
       self.loginConstraint.constant-=[UIScreen mainScreen].bounds.size.width;
        self.registerBtn.selected=YES;
    }else{
        self.loginConstraint.constant=0;
        self.registerBtn.selected=NO;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

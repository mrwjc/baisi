//
//  JCFriendTrendsController.m
//  百思
//
//  Created by mr.w on 16/5/6.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCFriendTrendsController.h"
#import "UIBarButtonItem+JCNavigationItem.h"
@interface JCFriendTrendsController ()

@end

@implementation JCFriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
}

-(void)setNav{
    self.navigationItem.title=@"我的关注";
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] SelectImg:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(add)];
}
-(void)add{
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIViewController *viewController=[[UIViewController alloc]init];
    viewController.view.backgroundColor=[UIColor greenColor];
    
    
    
    [self.navigationController pushViewController:viewController animated:YES];
}
@end

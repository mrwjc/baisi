//
//  JCTabBarController.m
//  百思
//
//  Created by mr.w on 16/5/5.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCTabBarController.h"
#import "JCTabBar.h"
@interface JCTabBarController ()

@end

@implementation JCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpAllChildViewControllers];
    
    [self setValue:[[JCTabBar alloc]init] forKeyPath:@"tabBar"];
    
   // NSLog(@"%@",self.tabBar);
}
/**
 *  统一添加子控制器
 */
-(void)setUpAllChildViewControllers{
    UIViewController *essence=[[UIViewController alloc]init];
    [self setUpChildViewController:essence Title:@"精华" image:[UIImage imageNamed:@"tabBar_essence_icon"] selectImage:[UIImage imageNamed:@"tabBar_essence_click_icon"]];
    
    
    UIViewController *newVc=[[UIViewController alloc]init];
    [self setUpChildViewController:newVc Title:@"新帖" image:[UIImage imageNamed:@"tabBar_new_icon"] selectImage:[UIImage imageNamed:@"tabBar_new_click_icon"]];
    
    UIViewController *friendTrends=[[UIViewController alloc]init];
    [self setUpChildViewController:friendTrends Title:@"关注" image:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selectImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"]];
    
    UIViewController *meVc=[[UIViewController alloc]init];
    [self setUpChildViewController:meVc Title:@"我" image:[UIImage imageNamed:@"tabBar_me_icon"] selectImage:[UIImage imageNamed:@"tabBar_me_click_icon"]];
    
}
/**
 *  设置
 *
 *  @param viewController 传入的控制器
 *  @param title          item的标题
 *  @param image          item的image
 *  @param selectImage    item的selectImage
 */
-(void)setUpChildViewController:(UIViewController *)viewController Title:(NSString *)title  image:(UIImage *)image selectImage:(UIImage *)selectImage{
    viewController.view.backgroundColor=[UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1];
    viewController.tabBarItem.title=title;
    viewController.tabBarItem.image=image;
    viewController.tabBarItem.selectedImage=selectImage;
    [self addChildViewController:viewController];
}

@end

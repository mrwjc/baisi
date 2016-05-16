//
//  JCTabBarController.m
//  百思
//
//  Created by mr.w on 16/5/5.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCTabBarController.h"
#import "JCTabBar.h"
#import "JCNavigationController.h"
#import "JCEssenceController.h"
#import "JCMeViewController.h"
#import "JCNewPostsController.h"
#import "JCFriendTrendsController.h"
@interface JCTabBarController ()

@end

@implementation JCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *attr=[NSMutableDictionary dictionary];
    
    attr[NSForegroundColorAttributeName]=[UIColor darkGrayColor];
    
    UITabBarItem *item=[UITabBarItem appearance];
    
    [item setTitleTextAttributes:attr forState:UIControlStateSelected];
    
    [self setUpAllChildViewControllers];
    
    [self setValue:[[JCTabBar alloc]init] forKeyPath:@"tabBar"];
    
    
    
    NSLog(@"%@",self.childViewControllers);
}
/**
 *  统一添加子控制器
 */
-(void)setUpAllChildViewControllers{
    
     JCEssenceController *essence=[[JCEssenceController alloc]init];
    [self setUpChildViewController:essence Title:@"精华" image:[UIImage imageNamed:@"tabBar_essence_icon"] selectImage:[UIImage imageNamed:@"tabBar_essence_click_icon"]];
    
    
    JCNewPostsController* newVc=[[JCNewPostsController alloc]init];
    [self setUpChildViewController:newVc Title:@"新帖" image:[UIImage imageNamed:@"tabBar_new_icon"] selectImage:[UIImage imageNamed:@"tabBar_new_click_icon"]];
    
    JCFriendTrendsController *friendTrends=[[JCFriendTrendsController alloc]init];
    [self setUpChildViewController:friendTrends Title:@"关注" image:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selectImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"]];
    
    JCMeViewController *meVc=[[JCMeViewController alloc]init];
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
    //viewController.view.backgroundColor=JCColor;
    viewController.tabBarItem.title=title;
    viewController.tabBarItem.image=image;
    viewController.tabBarItem.selectedImage=selectImage;
    JCNavigationController *naVC=[[JCNavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:naVC];
}

@end

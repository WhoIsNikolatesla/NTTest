//
//  NTTabBarController.m
//  NTTest
//
//  Created by chenzhaoliu on 16/6/30.
//  Copyright © 2016年 chenzhaoliu. All rights reserved.
//

#import "NTTabBarController.h"
#import "NTEssenceViewController.h"
#import "NTFriendTrendsViewController.h"
#import "NTNewViewController.h"
#import "NTMeController.h"
#import "NTNavigationViewController.h"
#import "NTTabBar.h"

@interface NTTabBarController ()

@end

@implementation NTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChildViewController];
    
    // 用自定义tabBar替换tabBar
    [self setValue:[[NTTabBar alloc] init] forKey:@"tabBar"];
}

# pragma mark - 通过NSAttributedString里的属性修改tabbar字体颜色
+ (void)initialize {
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    
}

# pragma mark - 创建tabBar子控制器
- (void)setUpChildViewController {
    
    NTEssenceViewController *essence = [[NTEssenceViewController alloc] init];
    [self setUpOneChildViewController:essence title:@"精华" normalImage:@"tabBar_essence_icon" selectImage:@"tabBar_essence_click_icon"];
    
    NTNewViewController *new = [[NTNewViewController alloc] init];
    [self setUpOneChildViewController:new title:@"新帖" normalImage:@"tabBar_new_icon" selectImage:@"tabBar_new_click_icon"];
    
    NTFriendTrendsViewController *friend = [[NTFriendTrendsViewController alloc] init];
    [self setUpOneChildViewController:friend title:@"关注" normalImage:@"tabBar_friendTrends_icon" selectImage:@"tabBar_friendTrends_click_icon"];
    
    NTMeController *me = [[NTMeController alloc] init];
    [self setUpOneChildViewController:me title:@"我" normalImage:@"tabBar_me_icon" selectImage:@"tabBar_me_click_icon"];
    
}

# pragma mark - 创建tabBar子控制器
- (void)setUpOneChildViewController:(UIViewController *)viewController title:(NSString *)title normalImage:(NSString *)normalImage selectImage:(NSString *)selectImage {
    
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:normalImage];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    [self addChildViewController:[[NTNavigationViewController alloc] initWithRootViewController:viewController]];
}

@end

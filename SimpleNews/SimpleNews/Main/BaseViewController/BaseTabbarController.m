//
//  BaseTabBarControlle.m
//  SimpleNews
//
//  Created by MrMessy on 16/6/24.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

#import "BaseTabbarController.h"
#import "XZMTabbarExtension.h"
#import "SimpleNews-Swift.h"
#import "NewsViewController.h"

@interface BaseTabbarController ()<XZMTabbarExtensionDelegate>

@end

@implementation BaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    _itemArray = [[NSMutableArray alloc] init];
    _titles = [[NSMutableArray alloc] init];
    
    //新闻
    NewsViewController *news = [[NewsViewController alloc] init];
    [self addVC:news title:@"资讯" selectedImage:@"tabBar_essence_click_icon" image:@"tabBar_essence_icon"];
    
    [self initTabbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 自定义TabBar
- (void)initTabbar {
    //自定义tabbar
    _customTabbar = [[XZMTabbarExtension alloc] initWithFrame:self.tabBar.frame];
    _customTabbar.backgroundColor = [UIColor whiteColor];
    _customTabbar.items = _itemArray;
    _customTabbar.delegate = self;
    [self.view addSubview:_customTabbar];
}

#pragma mark - 添加自控制器方法
- (void)addVC:(UIViewController *)childVC title:(NSString *) title selectedImage:(NSString *)selectedImage image:(NSString *)image {
    //创建导航控制器
    MMBaseNavigationController *navVC = [[MMBaseNavigationController alloc] initWithRootViewController:childVC];
    //创建模型
    UITabBarItem *tabbarItem = [[UITabBarItem alloc] init];
    tabbarItem.title = title;
    tabbarItem.image = [UIImage imageNamed:image];
    tabbarItem.selectedImage = [UIImage imageNamed:selectedImage];
    //添加到模型数组
    [_itemArray addObject:tabbarItem];
    [self addChildViewController:navVC];
}

#pragma mark - XZMTabbarExtensionDelegate
- (void)xzm_tabBar:(XZMTabbarExtension *)tabBar didSelectItem:(NSInteger)index {
    self.selectedIndex = index;
}

@end

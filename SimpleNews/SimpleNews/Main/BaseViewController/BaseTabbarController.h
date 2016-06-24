//
//  BaseTabBarControlle.h
//  SimpleNews
//
//  Created by MrMessy on 16/6/24.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZMTabbarExtension.h"

@interface BaseTabbarController : UITabBarController

@property (nonatomic, strong) XZMTabbarExtension *customTabbar;
@property (nonatomic, strong) NSMutableArray *itemArray;
@property (nonatomic, strong) NSMutableArray *titles;

@end

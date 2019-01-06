//
//  RLBaseTabBarController.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/28.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "RLBaseTabBarController.h"

@interface RLBaseTabBarController ()

@end

@implementation RLBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    UIViewController *vc = [self.viewControllers objectAtIndex: [tabBar.items indexOfObject:item]];
    MainAppdelegate.currentNav = (RLBaseNavigationController *)vc;
}

@end

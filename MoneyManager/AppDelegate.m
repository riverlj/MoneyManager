//
//  AppDelegate.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/28.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "AppDelegate.h"
#import "RLBaseTabBarController.h"
#import "RLBaseNavigationController.h"
#import "RLIncomeViewController.h"
#import "RLSpendingViewController.h"
#import "RLSettingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = [RLBaseTheme backgroundColor];
    self.window.rootViewController = [self createRootVc];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIViewController *)createRootVc {
    RLBaseTabBarController * tabBar = [[RLBaseTabBarController alloc] init];
    RLSpendingViewController *spendingVc = [[RLSpendingViewController alloc] init];
    RLBaseNavigationController *spendingNav = [[RLBaseNavigationController alloc] initWithRootViewController: spendingVc];
    
    RLIncomeViewController *incomeVc = [[RLIncomeViewController alloc] init];
    RLBaseNavigationController *incomeNav = [[RLBaseNavigationController alloc] initWithRootViewController: incomeVc];
    
    RLSettingViewController *settingVc = [[RLSettingViewController alloc] init];
    RLBaseNavigationController *settingNav = [[RLBaseNavigationController alloc] initWithRootViewController: settingVc];
    
    [tabBar setViewControllers:@[spendingNav, incomeNav, settingNav]];
    
    spendingVc.title = @"支出";
    incomeVc.title = @"收入";
    settingVc.title = @"设置";
    
    return tabBar;
}


@end

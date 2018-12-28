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
@property (nonatomic, strong) RLBaseNavigationController *currentNav;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = [RLBaseTheme backgroundColor];
    self.window.rootViewController = [self createRootVc];
    [self.window makeKeyAndVisible];
    [RLGlobalDataCenter instanceGlobalDataCenter].unit = @"元";
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

    self.currentNav = spendingNav;
    
    return tabBar;
}


- (void)push:(UIViewController *)vc {
    if (self.currentNav.viewControllers.count == 1) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [self.currentNav pushViewController:vc animated:YES];
}

- (void)pop {
    [self.currentNav popViewControllerAnimated:YES];
}


@end

//
//  AppDelegate.h
//  MoneyManager
//
//  Created by RiverLi on 2018/12/28.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLBaseNavigationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) RLBaseNavigationController *currentNav;

- (void)push:(UIViewController *)vc;
- (void)pop;
@end


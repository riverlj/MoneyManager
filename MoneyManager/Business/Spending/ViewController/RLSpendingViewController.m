//
//  RLSpendingViewController.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/28.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "RLSpendingViewController.h"
#import "RLAddSpendingViewController.h"
#import "AppDelegate.h"

@interface RLSpendingViewController ()

@end

@implementation RLSpendingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *createButton = [UIButton navRightAddButton:self action:@selector(gotoAddSpendingVc)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:createButton];
    
}

- (void)gotoAddSpendingVc {
    RLAddSpendingViewController *addSpendingVc = [[RLAddSpendingViewController alloc] init];
    [MainAppdelegate push:addSpendingVc];
}

@end

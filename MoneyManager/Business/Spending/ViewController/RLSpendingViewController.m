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
    
    UIButton *createButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [createButton setTitle:@"添加" forState:UIControlStateNormal];
    [createButton setTitle:@"添加" forState:UIControlStateHighlighted];
    [createButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [createButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [createButton addTarget:self action:@selector(gotoAddSpendingVc) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:createButton];
    
}

- (void)gotoAddSpendingVc {
    RLAddSpendingViewController *addSpendingVc = [[RLAddSpendingViewController alloc] init];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate push:addSpendingVc];
}

@end

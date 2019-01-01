//
//  RLSpendingClassifyViewController.m
//  MoneyManager
//
//  Created by RiverLi on 2019/1/1.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import "RLSpendingClassifyViewController.h"
#import "RLClassifyModel.h"

@interface RLSpendingClassifyViewController ()

@end

@implementation RLSpendingClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *classifyPath = [[NSBundle mainBundle] pathForResource:@"Classify" ofType:@"plist"];
    NSArray *classifyArray = [[NSArray alloc] initWithContentsOfFile:classifyPath];
    NSArray<RLClassifyModel *> *sourceArray = [NSArray yy_modelArrayWithClass:[RLClassifyModel class] json:classifyArray];
    self.tableViewDataSource = sourceArray;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)registerCells {
    
}


@end

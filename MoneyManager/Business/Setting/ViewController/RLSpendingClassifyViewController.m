//
//  RLSpendingClassifyViewController.m
//  MoneyManager
//
//  Created by RiverLi on 2019/1/1.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import "RLSpendingClassifyViewController.h"
#import "RLClassifyModel.h"
#import "RLChooseTableViewCell.h"

@interface RLSpendingClassifyViewController ()

@end

@implementation RLSpendingClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *classifyPath = [[NSBundle mainBundle] pathForResource:@"Classify" ofType:@"plist"];
    NSArray *classifyArray = [[NSArray alloc] initWithContentsOfFile:classifyPath];
    NSArray<RLClassifyModel *> *sourceArray = [NSArray yy_modelArrayWithClass:[RLClassifyModel class] json:classifyArray];
    
    self.tableViewDataSource = sourceArray;
    self.tableView.scrollEnabled = NO;
    
    self.title = @"一级支出分类";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)registerCells {
 
    [self.tableView registerClass:[RLChooseTableViewCell class] forCellReuseIdentifier:NSStringFromClass([RLChooseTableViewCell class])];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end

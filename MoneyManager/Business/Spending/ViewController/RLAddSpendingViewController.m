//
//  RLAddSpendingViewController.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/28.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "RLAddSpendingViewController.h"
#import "RLDataBaseUtil.h"
#import <CoreData/CoreData.h>
#import "Money+CoreDataProperties.h"
#import "SpendingMoneyTableViewCell.h"
#import "SpendingModel.h"

#define K_IDENTIFIER_BaseSpendingTableViewCell  @"K_IDENTIFIER_BaseSpendingTableViewCell"

@interface RLAddSpendingViewController()<UITableViewDelegate, UITableViewDataSource>
   @property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIView *footerView;
@end

@implementation RLAddSpendingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"增加一笔支出";
    [self initData];
    [self.tableView reloadData];
}

- (void)initData {
    SpendingModel *spendingModel = [[SpendingModel alloc] init];
    spendingModel.cellHeight = 44;
    spendingModel.cellClassName = NSStringFromClass([SpendingMoneyTableViewCell class]);
    self.tableViewDataSource = [[[NSMutableArray alloc] initWithObjects:spendingModel, nil] copy];
}

- (void)registerCells {
    [self.tableView registerClass:[SpendingMoneyTableViewCell class] forCellReuseIdentifier:NSStringFromClass([SpendingMoneyTableViewCell class])];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, RLBaseTheme.screenWidth, 64)];
        [_footerView addSubview:self.saveButton];
    }
    return _footerView;
}

- (UIButton *)saveButton {
    if (!_saveButton) {
        _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _saveButton.frame = CGRectMake(15, 10, (RLBaseTheme.screenWidth-30), 44);
        _saveButton.layer.cornerRadius = 8;
        [_saveButton setTitle:@"保存" forState:UIControlStateNormal];
        [_saveButton setTitle:@"保存" forState:UIControlStateHighlighted];
        [_saveButton setBackgroundColor:[UIColor blueColor]];
        [_saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [_saveButton addTarget:self action:@selector(saveData:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveButton;
}

- (void)saveData:(UIButton *)sender {
    
    
}


@end 

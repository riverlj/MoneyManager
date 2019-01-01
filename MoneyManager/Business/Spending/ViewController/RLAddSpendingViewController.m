//
//  RLAddSpendingViewController.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/28.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "RLAddSpendingViewController.h"
#import "BaseSpendingTableViewCell.h"
#import "RLDataBaseUtil.h"
#import <CoreData/CoreData.h>
#import "Money+CoreDataProperties.h"

#define K_IDENTIFIER_BaseSpendingTableViewCell  @"K_IDENTIFIER_BaseSpendingTableViewCell"

@interface RLAddSpendingViewController()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) BaseSpendingTableViewCell *amountCell;
@property (nonatomic, strong) BaseSpendingTableViewCell *categoryCell;
@property (nonatomic, copy) UITableView *tableView;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIView *footerView;
@end

@implementation RLAddSpendingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"增加一笔支出";
    [self.view addSubview:self.tableView];
    [self registerCell];
    self.tableView.tableFooterView = self.footerView;
}

- (void)registerCell {
    [self.tableView registerClass:[BaseSpendingTableViewCell class] forCellReuseIdentifier:K_IDENTIFIER_BaseSpendingTableViewCell];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, RLBaseTheme.screenWidth, RLBaseTheme.screenHeight) style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}


//MARK: tableViewDelegate & tableViewDatasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:K_IDENTIFIER_BaseSpendingTableViewCell];
    if (indexPath.row == 0) {
        BaseSpendingTableViewCell *spendingCell = (BaseSpendingTableViewCell *)cell;
        [spendingCell setTitle:@"金额" detail:@"25元"];
        return spendingCell;
    } else if (indexPath.row == 1) {
        BaseSpendingTableViewCell *spendingCell = (BaseSpendingTableViewCell *)cell;
        [spendingCell setTitle:@"用途" detail:@"餐饮_午餐"];
        return spendingCell;
    }
    return [UITableViewCell new];
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

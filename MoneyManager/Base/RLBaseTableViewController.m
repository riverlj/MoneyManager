//
//  RLBaseTableViewController.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/31.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "RLBaseTableViewController.h"
#import "RLBaseTableViewCell.h"

@interface RLBaseTableViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView *footerView;
@end

@implementation RLBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self registerCells];
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

- (void)registerCells{}

//MARK: tableViewDelegate & tableViewDatasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<RLCellModel> model = self.tableViewDataSource[indexPath.row];
    return model.cellHeight;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<RLCellModel> model = self.tableViewDataSource[indexPath.row];
    RLBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellClassName];
    [cell setData:model];
    return cell;
}

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, RLBaseTheme.screenWidth, 64)];
    }
    return _footerView;
}

//MARK: setter
- (void)setTableViewDataSource:(NSArray<id<RLCellModel>> *)tableViewDataSource {
    _tableViewDataSource = tableViewDataSource;
    [self.tableView reloadData];
}

@end

//
//  RLBaseTableViewController.h
//  MoneyManager
//
//  Created by RiverLi on 2018/12/31.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "RLBaseViewController.h"
#import "RLCellModel.h"

@interface RLBaseTableViewController : RLBaseViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)NSArray<id<RLCellModel>> *tableViewDataSource;
@property (nonatomic, copy) UITableView *tableView;

/**
 子类必须实现，注册cell
 */
- (void)registerCells;
@end

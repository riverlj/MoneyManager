//
//  RLUnitViewController.m
//  MoneyManager
//
//  Created by RiverLi on 2019/1/6.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import "RLUnitViewController.h"
#import "RLChooseTableViewCell.h"
#import "RLUnitModel.h"
@interface RLUnitViewController ()
@property (nonatomic, copy)NSString *mainKey;

@end

@implementation RLUnitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataSource];
}
      
- (void)initDataSource {
    NSString *unit = [RLGlobalDataCenter instanceGlobalDataCenter].unit;
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    RLUnitModel *model0 = [[RLUnitModel alloc] init];
    model0.title = @"元";
    model0.isSelected = [unit isEqualToString:model0.title];
    model0.cellClassName = NSStringFromClass([RLChooseTableViewCell class]);
    model0.cellHeight = 44;
    [array addObject:model0];

    RLUnitModel *model1 = [[RLUnitModel alloc] init];
    model1.title = @"美元";
    model1.isSelected = [unit isEqualToString:model1.title];
    model1.cellClassName = NSStringFromClass([RLChooseTableViewCell class]);
    model1.cellHeight = 44;
    [array addObject:model1];

    self.tableViewDataSource = array;
}

- (void)registerCells {
    [self.tableView registerClass:[RLChooseTableViewCell class] forCellReuseIdentifier:NSStringFromClass([RLChooseTableViewCell class])];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RLUnitModel *unitModel = self.tableViewDataSource[indexPath.row];
    unitModel.isSelected = YES;
    [[NSUserDefaults standardUserDefaults] setValue:unitModel.title forKey:@"k_default_unit"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    for (RLUnitModel *model in self.tableViewDataSource) {
        if (model != unitModel) {
            model.isSelected = NO;
        }
    }
    [self.tableView reloadData];
}

@end

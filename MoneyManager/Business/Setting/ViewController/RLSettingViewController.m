//
//  RLSettingViewController.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/28.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "RLSettingViewController.h"
#import "SettingModel.h"
#import "SettingTableViewCell.h"

@interface RLSettingViewController ()

@end

@implementation RLSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildDataSource];
    self.tableView.scrollEnabled = NO;
}

- (void)registerCells {
    [self.tableView registerClass:[SettingTableViewCell class] forCellReuseIdentifier:NSStringFromClass([SettingTableViewCell class])];
}

- (void)buildDataSource {
    NSArray *srcArray = @[@"货币单位", @"支出分类", @"收入分类", @"反馈"];
    NSMutableArray *dataSource = [[NSMutableArray alloc] initWithCapacity:srcArray.count];
    for (NSString *title in srcArray) {
        SettingModel * model = [[SettingModel alloc] init];
        model.cellClassName = NSStringFromClass([SettingTableViewCell class]);
        model.title = title;
        model.cellHeight = 44;
        [dataSource addObject:model];
    }
    self.tableViewDataSource = [dataSource copy];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
    } else if(indexPath.row == 1) {
        
    } else if(indexPath.row == 2) {
        
    } else if(indexPath.row == 3) {
        
    }
}

@end

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
#import "ClassifyUtil.h"
#import "RLSpendingSubClassifyViewController.h"

@interface RLSpendingClassifyViewController ()
@property (nonatomic, assign)SPENDING_CLASSIFY_LEVEL level;
@end

@implementation RLSpendingClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *createButton = [UIButton navRightAddButton:self action:@selector(addClassify)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:createButton];
    
   [self refreshView];
    self.tableView.scrollEnabled = NO;
    self.title = @"一级支出分类";
}

- (void) addClassify {
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    SCLTextView *textField = [alert addTextField:@"请输入分类名"];
    [alert addButton:@"确定" actionBlock:^(void) {
        if ([ClassifyUtil addClassify:textField.text]) {
            [self refreshView];
        } else {
            
        }
    }];
    
    [alert showEdit:self title:@"新增一个分类" subTitle:@"请在下方输入一级分类名称" closeButtonTitle:@"取消" duration:0.0f];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)registerCells {
 
    [self.tableView registerClass:[RLChooseTableViewCell class] forCellReuseIdentifier:NSStringFromClass([RLChooseTableViewCell class])];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RLClassifyModel *model = self.tableViewDataSource[indexPath.row];
    RLSpendingSubClassifyViewController *vc = [[RLSpendingSubClassifyViewController alloc] initWithTitle:model.name mainKey:model.key];
    [MainAppdelegate push:vc];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return TRUE;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    RLClassifyModel *model = self.tableViewDataSource[indexPath.row];
    switch (editingStyle) {
        case UITableViewCellEditingStyleNone:
        case UITableViewCellEditingStyleInsert:
            break;
        case UITableViewCellEditingStyleDelete: {
            if([ClassifyUtil deleteClassify:model.key]) {
                [self refreshView];
            }
        }
            break;
        default:
            break;
    }
}

- (void)refreshView {
    NSArray *classifyArray = [ClassifyUtil readClassify];
    NSArray<RLClassifyModel *> *sourceArray = [NSArray yy_modelArrayWithClass:[RLClassifyModel class] json:classifyArray];
    
    self.tableViewDataSource = sourceArray;
    [self.tableView reloadData];
}

@end

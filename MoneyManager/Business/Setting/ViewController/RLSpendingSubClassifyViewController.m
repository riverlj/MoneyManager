//
//  RLSpendingSubClassifyViewController.m
//  MoneyManager
//
//  Created by RiverLi on 2019/1/6.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import "RLSpendingSubClassifyViewController.h"
#import "SubClassifyUtil.h"
#import "RLClassifyModel.h"
#import "RLChooseTableViewCell.h"
@interface RLSpendingSubClassifyViewController ()
@property (nonatomic, copy)NSString *mainKey;
@end

@implementation RLSpendingSubClassifyViewController

- (instancetype)initWithTitle:(NSString *)title mainKey:(NSString *)mainKey {
    self = [super init];
    if (self) {
        self.title = title;
        self.mainKey = mainKey;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *createButton = [UIButton navRightAddButton:self action:@selector(addSubClassify)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:createButton];
    [self refreshView];
}

- (void)addSubClassify {
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    SCLTextView *textField = [alert addTextField:@"请输入子分类名"];
    [alert addButton:@"确定" actionBlock:^(void) {
        if ([SubClassifyUtil addClassify:textField.text mainKey:self.mainKey]) {
            [self refreshView];
        } else {
            
        }
    }];
    
    [alert showEdit:self title:@"新增一个子分类" subTitle:@"请在下方输入子分类名称" closeButtonTitle:@"取消" duration:0.0f];
}

- (void)registerCells {
    [self.tableView registerClass:[RLChooseTableViewCell class] forCellReuseIdentifier:NSStringFromClass([RLChooseTableViewCell class])];
}


- (void)refreshView {
    NSArray *array = [SubClassifyUtil findSubClassifyWith:self.mainKey];
    NSArray<RLClassifyModel *> *sourceArray = [NSArray yy_modelArrayWithClass:[RLClassifyModel class] json:array];
    self.tableViewDataSource = sourceArray;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
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
            if([SubClassifyUtil deleteClassify:model.key mainKey:self.mainKey]) {
                [self refreshView];
            }
        }
            break;
        default:
            break;
    }
}

@end

//
//  RLBaseTableViewCell.h
//  MoneyManager
//
//  Created by RiverLi on 2018/12/31.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLBaseTableViewCell : UITableViewCell
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, assign) BOOL islineViewHidden;
- (void)setData:(id<RLCellModel>)data;
@end

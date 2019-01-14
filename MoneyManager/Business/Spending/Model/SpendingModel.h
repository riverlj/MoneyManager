//
//  SpendingModel.h
//  MoneyManager
//
//  Created by RiverLi on 2018/12/31.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoneyProtocal.h"
#import "RLBaseCellModel.h"

@interface SpendingModel : RLBaseCellModel
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *cost; // 花费金额
@property (nonatomic, copy)NSString *note; // 备注
@property (nonatomic, copy)NSString *oneCategoryId;
@property (nonatomic, copy)NSString *oneCategoryName;
@property (nonatomic, copy)NSString *twoCategoryId;
@property (nonatomic, copy)NSString *twoCategoryName;
@end

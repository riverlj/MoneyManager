//
//  SpendingModel.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/31.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "SpendingModel.h"

@implementation SpendingModel
- (NSString *)title {
    if (!_title) {
        _title = @"金额";
    }
    return _title;
}
@end

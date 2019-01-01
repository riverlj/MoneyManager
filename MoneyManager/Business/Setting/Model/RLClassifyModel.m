//
//  RLClassifyModel.m
//  MoneyManager
//
//  Created by RiverLi on 2019/1/1.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import "RLClassifyModel.h"
#import "RLChooseTableViewCell.h"

@implementation RLClassifyModel
- (CGFloat)cellHeight {
    return 44;
}

- (NSString *)cellClassName {
    return NSStringFromClass([RLChooseTableViewCell class]);
}

@end

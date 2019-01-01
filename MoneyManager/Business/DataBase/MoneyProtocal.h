//
//  MoneyProtocal.h
//  MoneyManager
//
//  Created by RiverLi on 2018/12/29.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MoneyProtocal <NSObject>
@property (nonatomic, assign) int16_t moneyCategory;
@property (nonatomic, assign) int64_t moneyUseOneCategory;
@property (nonatomic, assign) int64_t moneyUseTwoCategory;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, assign) double count;

@property (nonatomic, copy) NSString *moneyCategoryLabel;
@property (nonatomic, copy) NSString *moneyUseOneCategoryLabel;
@property (nonatomic, copy) NSString *moneyUseTwoCategoryLabel;
@end

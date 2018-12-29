//
//  Money+CoreDataProperties.h
//  MoneyManager
//
//  Created by RiverLi on 2018/12/29.
//  Copyright © 2018年 RiverLi. All rights reserved.
//
//

#import "Money+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Money (CoreDataProperties)

+ (NSFetchRequest<Money *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *entityId;
@property (nonatomic) int16_t moneyCategory;
@property (nonatomic) int64_t moneyUseOneCategory;
@property (nonatomic) int64_t moneyUseTwoCategory;
@property (nullable, nonatomic, copy) NSString *comment;
@property (nonatomic) int64_t count;

@end

NS_ASSUME_NONNULL_END

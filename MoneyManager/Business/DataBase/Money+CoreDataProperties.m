//
//  Money+CoreDataProperties.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/31.
//  Copyright © 2018年 RiverLi. All rights reserved.
//
//

#import "Money+CoreDataProperties.h"

@implementation Money (CoreDataProperties)

+ (NSFetchRequest<Money *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Money"];
}

@dynamic comment;
@dynamic count;
@dynamic entityId;
@dynamic moneyCategory;
@dynamic moneyUseOneCategory;
@dynamic moneyUseTwoCategory;
@dynamic updateDate;

@end

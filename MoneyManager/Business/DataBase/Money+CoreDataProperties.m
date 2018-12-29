//
//  Money+CoreDataProperties.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/29.
//  Copyright © 2018年 RiverLi. All rights reserved.
//
//

#import "Money+CoreDataProperties.h"

@implementation Money (CoreDataProperties)

+ (NSFetchRequest<Money *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Money"];
}

@dynamic entityId;
@dynamic moneyCategory;
@dynamic moneyUseOneCategory;
@dynamic moneyUseTwoCategory;
@dynamic comment;
@dynamic count;

@end

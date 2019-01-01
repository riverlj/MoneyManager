//
//  RLDataBaseUtil.h
//  MoneyManager
//
//  Created by RiverLi on 2018/12/29.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money+CoreDataClass.h"
#import "MoneyProtocal.h"

@interface RLDataBaseUtil : NSObject
+ (instancetype)sharedInstance;

@property(nonatomic, strong) NSManagedObjectContext *objectContext;
@property(nonatomic, strong) NSManagedObjectModel *objectModel;
@property(nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (BOOL)addSpending:(id<MoneyProtocal>) saveMoney;
@end

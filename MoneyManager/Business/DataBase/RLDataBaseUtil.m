//
//  RLDataBaseUtil.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/29.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "RLDataBaseUtil.h"
#import <CoreData/CoreData.h>

@interface RLDataBaseUtil()
@end

@implementation RLDataBaseUtil

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static RLDataBaseUtil *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (NSURL*)applicationDocumentsDirectory {
    return[[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
}

-(NSManagedObjectContext *)objectContext {
    if (!_objectContext) {
        _objectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_objectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    }
    return _objectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (!_persistentStoreCoordinator) {
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.objectModel];
        NSError *error = nil;
        NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"money.sqlite"];
        if ([_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            NSLog(@"创建数据库失败:%@", error);
        }
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectModel *)objectModel {
    if (!_objectModel) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"MoneyDataBase" withExtension:@"momd"];
        _objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:url];
    }
    return _objectModel;
}

- (BOOL)addSpending:(id<MoneyProtocal>) saveMoney {
    Money *money = [NSEntityDescription insertNewObjectForEntityForName:@"Money" inManagedObjectContext:[RLDataBaseUtil sharedInstance].objectContext];
    money.count = saveMoney.count;
    money.moneyCategory = saveMoney.moneyCategory;
    money.moneyUseOneCategory = saveMoney.moneyUseOneCategory;
    money.moneyUseTwoCategory = saveMoney.moneyUseTwoCategory;
    NSTimeInterval timeInterVal = [[NSDate date] timeIntervalSince1970];
    money.updateDate = (NSInteger)timeInterVal;
    money.comment = saveMoney.comment;
    
    NSError *error = nil;
    return [[RLDataBaseUtil sharedInstance].objectContext save:&error];
}


@end

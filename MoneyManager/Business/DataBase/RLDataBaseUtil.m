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
@property(nonatomic, strong) NSManagedObjectContext *objectContext;
@property(nonatomic, strong) NSManagedObjectModel *objectModel;
@property(nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
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

-(NSManagedObjectContext *)objectContext {
    if (!_objectContext) {
        _objectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    }
    return _objectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (!_persistentStoreCoordinator) {
        
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectModel *)objectModel {
    if (!_objectModel) {
        
    }
    return _objectModel;
}

@end

//
//  RLGlobalDataCenter.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/28.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "RLGlobalDataCenter.h"

static RLGlobalDataCenter *dataCenter;
@implementation RLGlobalDataCenter
+ (instancetype)instanceGlobalDataCenter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[RLGlobalDataCenter alloc] init];
    });
    return dataCenter;
}

@end

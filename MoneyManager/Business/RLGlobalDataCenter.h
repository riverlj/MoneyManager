//
//  RLGlobalDataCenter.h
//  MoneyManager
//
//  Created by RiverLi on 2018/12/28.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GlobalDataCenter = [RLGlobalDataCenter instanceGlobalDataCenter]

@interface RLGlobalDataCenter : NSObject
+ (instancetype)instanceGlobalDataCenter;

@property (nonatomic, copy) NSString *unit;
@end

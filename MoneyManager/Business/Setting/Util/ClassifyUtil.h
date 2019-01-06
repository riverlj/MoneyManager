//
//  ClassifyUtil.h
//  MoneyManager
//
//  Created by RiverLi on 2019/1/6.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassifyUtil : NSObject
+ (void)initClassify;
+ (BOOL)addClassify:(NSString *)name;
+ (NSArray *)readClassify;
+ (BOOL)deleteClassify:(NSString *)key;
@end

//
//  SubClassfiyUtil.h
//  MoneyManager
//
//  Created by RiverLi on 2019/1/6.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubClassifyUtil : NSObject
+ (void)initSubClassify;
+ (NSArray *)findSubClassifyWith:(NSString *)mainKey;
+ (BOOL)deleteClassify:(NSString *)subKey mainKey:(NSString *)mainKey;
+ (BOOL)addClassify:(NSString *)name mainKey:(NSString *)mainKey;
@end

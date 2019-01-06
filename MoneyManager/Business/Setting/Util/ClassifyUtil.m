//
//  ClassifyUtil.m
//  MoneyManager
//
//  Created by RiverLi on 2019/1/6.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import "ClassifyUtil.h"
#import "RLClassifyModel.h"

@implementation ClassifyUtil

+ (void)initClassify {
    if ([self checkRealClassifyIsExit]) {
        return;
    } else {
        NSArray *array = [self readClassify: [self classifyPath]];
        [array writeToFile:[self realClassifyPath] atomically:YES];
    }
}

+ (BOOL)deleteClassify:(NSString *)key {
    NSArray *array = [self readClassify];
    NSMutableArray *mArray = [[NSMutableArray alloc] initWithArray:array];
    NSInteger index = 0;
    for (NSDictionary *dic in array) {
        if ([key isEqualToString:[dic valueForKey:@"key"]]) {
            break;
        }
        index ++;
    }
    [mArray removeObjectAtIndex:index];
    return [mArray writeToFile:[self realClassifyPath] atomically:YES];
}

+ (BOOL)addClassify:(NSString *)name {
    NSArray *array = [self readClassify];
    NSArray<RLClassifyModel *> *sourceArray = [NSArray yy_modelArrayWithClass:
                                               [RLClassifyModel class] json:array];
    for (RLClassifyModel *model  in sourceArray) {
        if ([model.name isEqualToString:name]) {
            return NO;
        }
    }
    RLClassifyModel *lastModel = sourceArray.lastObject;
    NSString *number = [lastModel.key substringFromIndex:4];
    NSString *nextNumber = @(number.integerValue + 1).stringValue;
    NSString *nextKey = [NSString stringWithFormat:@"main%@",nextNumber];
    NSMutableArray *resultArray = [[NSMutableArray alloc] initWithArray:array];
    [resultArray addObject:@{
                             @"key":nextKey,
                             @"name":name
                             }];
    return [resultArray writeToFile:[self realClassifyPath] atomically:YES];;
}


+ (NSArray *)readClassify {
    return [self readClassify:[self realClassifyPath]];
}


+ (NSArray *)readClassify:(NSString *)path {
    NSArray *classifyArray = [[NSArray alloc] initWithContentsOfFile:path];
    return classifyArray;
}

+ (NSString *)classifyPath {
    NSString *classifyPath = [[NSBundle mainBundle] pathForResource:@"Classify" ofType:@"plist"];
    return classifyPath;
}

+ (NSString *)realClassifyPath {
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *path = [docDir stringByAppendingPathComponent:@"Classify.plist"];
    return path;
}

+ (BOOL)checkRealClassifyIsExit {
    NSString *realPath = [self realClassifyPath];
    return [[NSFileManager defaultManager] fileExistsAtPath:realPath];
}
@end

//
//  SubClassfiyUtil.m
//  MoneyManager
//
//  Created by RiverLi on 2019/1/6.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import "SubClassifyUtil.h"

@implementation SubClassifyUtil
+ (void)initSubClassify {
    if ([self checkRealSubClassifyIsExit]) {
        return;
    } else {
        NSDictionary *dic = [self readAllSubClassify:[self subClassifyPath]];
        [dic writeToFile:[self realSubClassifyPath] atomically:YES];
    }
}

+ (BOOL)addClassify:(NSString *)name mainKey:(NSString *)mainKey {
    NSDictionary *dic = [self readAllSubClassify:[self realSubClassifyPath]];
    NSMutableArray *mainClassify = [[dic valueForKey:mainKey] mutableCopy];
    for (NSDictionary *tDic in mainClassify) {
        if ([name isEqualToString:[tDic valueForKey:@"name"]]) {
            return NO;
        }
    }
    NSDictionary *lastDic = [mainClassify lastObject];
    NSString *key = [lastDic valueForKey:@"key"];
    NSString *number = [key substringFromIndex:(mainKey.length + 3)];
    NSString *nextKey = [NSString stringWithFormat:@"%@sub%@",mainKey, @(number.integerValue + 1).stringValue];
    [mainClassify addObject:@{@"key":nextKey,
                              @"name": name
                              }];
    [dic setValue:mainClassify forKey:mainKey];
    return [dic writeToFile:[self realSubClassifyPath] atomically:YES];
    
             
}

+ (BOOL)deleteClassify:(NSString *)subKey mainKey:(NSString *)mainKey {
    NSDictionary *dic = [self readAllSubClassify:[self realSubClassifyPath]];
    NSMutableArray *mainClassify = [[dic valueForKey:mainKey] mutableCopy];
    if (mainClassify) {
        NSInteger index = 0;
        for (NSDictionary *subDic in mainClassify) {
            if ([subKey isEqualToString:[subDic valueForKey:@"key"]]) {
                break;
            }
            index ++;
        }
        [mainClassify removeObjectAtIndex:index];
        [dic setValue:mainClassify forKey:mainKey];
        return [dic writeToFile:[self realSubClassifyPath] atomically:YES];
    }
    return NO;
}

+ (NSArray *)findSubClassifyWith:(NSString *)mainKey {
    NSDictionary *dic = [self readAllSubClassify:[self realSubClassifyPath]];
    return [dic valueForKey:mainKey];
}

+ (NSDictionary *)readAllSubClassify:(NSString *)path {
    return [NSDictionary dictionaryWithContentsOfFile:path];
}

+ (NSString *)subClassifyPath {
    NSString *classifyPath = [[NSBundle mainBundle] pathForResource:@"SubClassify" ofType:@"plist"];
    return classifyPath;
}

+ (NSString *)realSubClassifyPath {
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *path = [docDir stringByAppendingPathComponent:@"SubClassify.plist"];
    return path;
}

+ (BOOL)checkRealSubClassifyIsExit {
    NSString *realPath = [self realSubClassifyPath];
    return [[NSFileManager defaultManager] fileExistsAtPath:realPath];
}
@end

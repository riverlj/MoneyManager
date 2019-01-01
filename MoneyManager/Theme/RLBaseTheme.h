//
//  RLBaseTheme.h
//  MoneyManager
//
//  Created by RiverLi on 2018/12/28.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RLBaseTheme : NSObject
// MARK: 颜色
+ (UIColor *)backgroundColor;
+ (UIColor *)oneLevelTitleColor;

// MARK: 字体
+ (UIFont *)oneLevelTitleFont;

// MARK: 尺寸
+ (CGFloat)screenWidth;
+ (CGFloat)screenHeight;
@end

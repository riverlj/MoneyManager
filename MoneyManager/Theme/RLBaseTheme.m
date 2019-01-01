//
//  RLBaseTheme.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/28.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "RLBaseTheme.h"

@implementation RLBaseTheme
+(UIColor *)backgroundColor {
    return [UIColor whiteColor];
}

+ (CGFloat)screenWidth {
    return UIScreen.mainScreen.bounds.size.width;
}
+ (CGFloat)screenHeight {
    return UIScreen.mainScreen.bounds.size.height;
}
@end

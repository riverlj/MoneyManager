//
//  UIButton+RLButtonQuickCreate.m
//  MoneyManager
//
//  Created by RiverLi on 2019/1/6.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import "UIButton+RLButtonQuickCreate.h"

@implementation UIButton (RLButtonQuickCreate)
+ (UIButton *)navRightAddButton:(nullable id)target action:(nonnull SEL)sel {
    UIButton *createButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [createButton setTitle:@"添加" forState:UIControlStateNormal];
    [createButton setTitle:@"添加" forState:UIControlStateHighlighted];
    [createButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [createButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [createButton addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return createButton;
}
@end

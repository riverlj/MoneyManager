//
//  RLCellModel.h
//  MoneyManager
//
//  Created by RiverLi on 2018/12/31.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol RLCellModel <NSObject>
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, copy)NSString *cellClassName;
@end

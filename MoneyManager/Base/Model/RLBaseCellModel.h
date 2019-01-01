//
//  RLBaseCellModel.h
//  MoneyManager
//
//  Created by RiverLi on 2019/1/1.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RLBaseCellModel : NSObject <RLCellModel>
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, copy)NSString *cellClassName;
@end

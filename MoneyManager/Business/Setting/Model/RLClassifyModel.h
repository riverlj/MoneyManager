//
//  RLClassifyModel.h
//  MoneyManager
//
//  Created by RiverLi on 2019/1/1.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import "RLBaseCellModel.h"

@interface RLClassifyModel : RLBaseCellModel
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *key;
@property (nonatomic, assign)BOOL isSelected;
@end

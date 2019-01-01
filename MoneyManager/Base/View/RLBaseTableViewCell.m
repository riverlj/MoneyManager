//
//  RLBaseTableViewCell.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/31.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "RLBaseTableViewCell.h"
#import "RLCellModel.h"

@implementation RLBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self defineCellStyle];
        [self addSubViews];
        [self buildLayout];
    }
    return self;
}

- (void)defineCellStyle {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)addSubViews {
    [self addSubview:self.lineView];
}

- (void)buildLayout {
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(15);
        make.right.equalTo(self.mas_right).offset(-15);
        make.height.mas_equalTo(0.5);
    }];
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor grayColor];
    }
    return _lineView;
}

- (void)setData:(id<RLCellModel>)data { }

- (void)setIslineViewHidden:(BOOL)islineViewHidden {
    _islineViewHidden = islineViewHidden;
    self.lineView.hidden = islineViewHidden;
}
@end

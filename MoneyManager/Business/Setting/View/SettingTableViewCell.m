//
//  SettingTableViewCell.m
//  MoneyManager
//
//  Created by RiverLi on 2018/12/31.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

#import "SettingTableViewCell.h"
#import "SettingModel.h"

@interface SettingTableViewCell()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation SettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self layoutViews];
    }
    return self;
}

- (void)layoutViews {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.top.bottom.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-60);
    }];
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (void)setData:(id<RLCellModel>)data {
    SettingModel *model = data;
    self.titleLabel.text = model.title;
    
}
@end

//
//  SpendingMoneyTableViewCell.m
//  MoneyManager
//
//  Created by RiverLi on 2019/1/14.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import "SpendingMoneyTableViewCell.h"
#import "SpendingModel.h"
@interface SpendingMoneyTableViewCell()<UITextFieldDelegate>
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UITextField *textField;
@property (nonatomic, strong)UILabel *unitLabel;
@end

@implementation SpendingMoneyTableViewCell


- (void)addSubViews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.unitLabel];
    [self.contentView addSubview:self.textField];
}

- (void)defineCellStyle {
    [super defineCellStyle];
    self.accessoryType = UITableViewCellAccessoryNone;
}

- (void)buildLayout {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.top.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(50);
    }];
    
    [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.top.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(44);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(10);
        make.right.equalTo(self.unitLabel.mas_left).offset(-6);
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
    }];
    
}

- (void)setData:(id<RLCellModel>)data {
    if ([data isKindOfClass:[SpendingModel class]]) {
        SpendingModel *spendingModel = (SpendingModel *)data;
        self.titleLabel.text = [NSString stringWithFormat:@"%@:", spendingModel.title];
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [RLBaseTheme oneLevelTitleFont];
        _titleLabel.textColor = [RLBaseTheme oneLevelTitleColor];
    }
    return _titleLabel;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.keyboardType = UIKeyboardTypeDecimalPad;
        _textField.textAlignment = NSTextAlignmentRight;
        _textField.placeholder = @"填写金额";
        _textField.font = [RLBaseTheme oneLevelTitleFont];
        _textField.tintColor = [UIColor lightGrayColor];
        _textField.textColor = [RLBaseTheme oneLevelTitleColor];
    }
    return _textField;
}

- (UILabel *)unitLabel {
    if (!_unitLabel) {
        _unitLabel = [[UILabel alloc] init];
        _unitLabel.font = [RLBaseTheme oneLevelTitleFont];
        _unitLabel.textColor = [RLBaseTheme oneLevelTitleColor];
        _unitLabel.text = [RLGlobalDataCenter instanceGlobalDataCenter].unit;
    }
    return _unitLabel;
}
 
@end

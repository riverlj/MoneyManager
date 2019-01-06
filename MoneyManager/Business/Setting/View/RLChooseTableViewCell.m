//
//  RLChooseTableViewCell.m
//  MoneyManager
//
//  Created by RiverLi on 2019/1/1.
//  Copyright © 2019年 RiverLi. All rights reserved.
//

#import "RLChooseTableViewCell.h"
#import "RLClassifyModel.h"
#import "RLUnitModel.h"
@interface RLChooseTableViewCell()
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *chooseImageView;
@end

@implementation RLChooseTableViewCell

- (void)addSubViews {
    [super addSubViews];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.chooseImageView];
}

- (void)defineCellStyle {
    [super defineCellStyle];
}

-(void)buildLayout {
    [super buildLayout];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.top.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(200);
    }];
    
    [self.chooseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.height.mas_equalTo(24);
    
    }];
}

- (void)setData:(id<RLCellModel>)data {
    if ([data isKindOfClass:[RLClassifyModel class]]) {
        RLClassifyModel *model = data;
        self.titleLabel.text = model.name;
        self.chooseImageView.hidden = NO;
    } else if([data isKindOfClass:[RLUnitModel class]]) {
        RLUnitModel *model = data;
        self.titleLabel.text = model.title;
        self.chooseImageView.hidden = !model.isSelected;
    }
    
}

- (UIImageView *)chooseImageView {
    if (!_chooseImageView) {
        _chooseImageView = [[UIImageView alloc] init];
        //TODO
        _chooseImageView.backgroundColor = [UIColor blueColor];
    }
    return _chooseImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [RLBaseTheme oneLevelTitleColor];
        _titleLabel.font = [RLBaseTheme oneLevelTitleFont];
    }
    return _titleLabel;
}


@end

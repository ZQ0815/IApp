//
//  FrequentUserViewCell.m
//  IApp
//
//  Created by 张强 on 2020/10/26.
//  Copyright © 2020 codeam. All rights reserved.
//

#import "FrequentUserViewCell.h"
#import "Masonry.h"

@interface FrequentUserViewCell ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *resetFrequentButton;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation FrequentUserViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        return [self initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"frequentcell"];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self configSubView];
    }
    return self;
    
}

- (void)configSubView {
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.resetFrequentButton];
    [self.contentView addSubview:self.lineView];
    
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(17);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImageView.mas_right).with.offset(12);
        make.centerY.mas_equalTo(self.contentView);
        make.height.mas_equalTo(self.contentView);
    }];
    
    [_resetFrequentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-17);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(65, 26));
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_nameLabel);
        make.bottom.mas_equalTo(self.contentView);
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.contentView);
    }];
    
}

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [UIImageView new];
        _avatarImageView.image = [UIImage imageNamed:@"img_1"];
        _avatarImageView.clipsToBounds = YES;
        _avatarImageView.layer.cornerRadius = 20;
    }
    return _avatarImageView;
}

- (UILabel *)nameLabel {
    if (_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.frame = CGRectMake(0, 0, 10, 10);
        _nameLabel.text = @"我真帅";
        [_nameLabel adjustsFontSizeToFitWidth];
        [_nameLabel sizeToFit];
    }
    return _nameLabel;
}

- (UIButton *)resetFrequentButton {
    if (_resetFrequentButton) {
        _resetFrequentButton = [UIButton new];
        _resetFrequentButton.frame = CGRectMake(0, 0, 65, 26);
        _resetFrequentButton.backgroundColor = [UIColor yellowColor];
    }
    return _resetFrequentButton;
}

- (UIView *)lineView {
    if (_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor grayColor];
    }
    return _lineView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

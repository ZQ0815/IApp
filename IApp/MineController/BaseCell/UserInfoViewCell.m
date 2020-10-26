//
//  UserInfoViewCell.m
//  IApp
//
//  Created by 张强 on 2020/10/26.
//  Copyright © 2020 codeam. All rights reserved.
//

#import "UserInfoViewCell.h"
#import "Masonry.h"

@interface UserInfoViewCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation UserInfoViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        return [self initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"userinfocell"];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configSubView];
    }
    return self;
    
}

- (void)configSubView {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    _label = [[UILabel alloc] init];
    _label.text = @"常看的人";
    [_label adjustsFontSizeToFitWidth];
    [self.contentView addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end

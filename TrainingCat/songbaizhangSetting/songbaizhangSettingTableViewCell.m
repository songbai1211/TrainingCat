//
//  songbaizhangSettingTableViewCell.m
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangSettingTableViewCell.h"

@interface songbaizhangSettingTableViewCell ()

@end

@implementation songbaizhangSettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
//        self.contentView.backgroundColor=ColorWithRGB(0xf5f5f5);
    }
    
    return self;
}


- (void)initView{
    
//
    self.logoImageVIew =[UIImageView new];
    [self.contentView addSubview:self.logoImageVIew];
    self.logoImageVIew.image = [UIImage imageNamed:@"icon"];
    [self.logoImageVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self).offset(20);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    self.logoImageVIew.layer.borderColor = UIColor.grayColor.CGColor;
    self.logoImageVIew.layer.cornerRadius =30;
    self.logoImageVIew.layer.borderWidth =0.5;
    self.logoImageVIew.layer.masksToBounds=YES;
    self.logoImageVIew.userInteractionEnabled=YES;
    self.nameLabel =[UILabel new];
    [self.contentView addSubview:self.nameLabel];
    self.nameLabel.font=[UIFont boldSystemFontOfSize:16];
    self.nameLabel.textColor=ColorWithRGB(0x1296db);
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.logoImageVIew.mas_right).offset(20);
        make.centerY.equalTo(self.logoImageVIew);
        make.width.mas_equalTo(100);
    }];
    self.nameLabel.text=@"猫咪主人";
    
//    self.button =[UIButton buttonWithType:0];
//    [self.button setTitle:@"修改昵称" forState:UIControlStateNormal];
//    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    self.button.backgroundColor=ColorWithRGB(0x1296db);
//    [self.contentView addSubview:self.button];
//    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.nameLabel.mas_right).offset(20);
//        make.centerY.equalTo(self.nameLabel);
//        make.size.mas_equalTo(CGSizeMake(40, 20));
//    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

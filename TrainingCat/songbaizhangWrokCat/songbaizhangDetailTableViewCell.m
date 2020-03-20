//
//  songbaizhangDetailTableViewCell.m
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangDetailTableViewCell.h"

@implementation songbaizhangDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
        self.contentView.backgroundColor=ColorWithRGB(0xf5f5f5);
    }
    
    return self;
}


- (void)initView{
    
    UIView *bgView=[UIView new];
    [self.contentView addSubview:bgView];
    bgView.layer.cornerRadius=8;
    bgView.backgroundColor=[UIColor whiteColor];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.top.equalTo(self.contentView.mas_top).offset(4);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-4);

    }];
    
    
    
    self.nameLabel =[UILabel new];
    [bgView addSubview:self.nameLabel];
    self.nameLabel.font=[UIFont boldSystemFontOfSize:16];
    self.nameLabel.textColor=ColorWithRGB(0x1296db);
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).offset(10);
        make.centerY.equalTo(bgView);

    }];
    self.nameLabel.text=@"加菲猫";
    
    
        self.textFiled =[UITextField new];
       [bgView addSubview:self.textFiled];
       self.textFiled.font=[UIFont boldSystemFontOfSize:16];
       self.textFiled.textColor=ColorWithRGB(0x1296db);
       [self.textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
           make.right.equalTo(bgView.mas_right).offset(-10);
           make.centerY.equalTo(bgView);
           
       }];
       self.textFiled.placeholder=@"请输入";

    
}

- (void)updataView:(NSString *)data{
    self.nameLabel.text=data;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  songbaizhangMyCatTableViewCell.m
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangMyCatTableViewCell.h"

@interface songbaizhangMyCatTableViewCell ()
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *catTypeLabel;
@property(nonatomic,strong)UILabel *catAgeLabel;
@property(nonatomic,strong)UILabel *catHealthLabel;
@property(nonatomic,strong)UILabel *catSexLabel;
@property(nonatomic,strong)UILabel *catMotherLabel;
@property(nonatomic,strong)UILabel *phoneLabel;
@property(nonatomic,strong)UIImageView *catImageView;
@end

@implementation songbaizhangMyCatTableViewCell

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
        make.top.equalTo(self.contentView.mas_top).offset(8);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);

    }];
    
    self.catImageView=[UIImageView new];
    [bgView addSubview:self.catImageView];
    [self.catImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 60));
        make.centerY.equalTo(bgView);
    }];
    
    self.nameLabel =[UILabel new];
    [bgView addSubview:self.nameLabel];
    self.nameLabel.font=[UIFont boldSystemFontOfSize:16];
    self.nameLabel.textColor=ColorWithRGB(0x1296db);
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.catImageView.mas_right).offset(10);
        make.top.equalTo(self.catImageView);

    }];
    self.nameLabel.text=@"加菲猫";
    
    
    
    self.catTypeLabel =[UILabel new];
      [bgView addSubview:self.catTypeLabel];
      self.catTypeLabel.font=[UIFont systemFontOfSize:13];
      self.catTypeLabel.textColor=ColorWithRGB(0x1296db);
      [self.catTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(self.nameLabel);
          make.top.equalTo(self.nameLabel.mas_bottom).offset(6);

      }];
      self.catTypeLabel.text=@"年龄";
    
    self.catAgeLabel =[UILabel new];
    [bgView addSubview:self.catAgeLabel];
    self.catAgeLabel.textAlignment=NSTextAlignmentRight;

    self.catAgeLabel.font=[UIFont systemFontOfSize:13];
    self.catAgeLabel.textColor=ColorWithRGB(0x1296db);
    [self.catAgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.catTypeLabel);
        make.right.equalTo(bgView.mas_right).offset(-10);
    }];
    self.catAgeLabel.text=@"爱吃的零食：";

    
    
    self.catHealthLabel =[UILabel new];
      [bgView addSubview:self.catHealthLabel];
      self.catHealthLabel.font=[UIFont systemFontOfSize:13];
      self.catHealthLabel.textColor=ColorWithRGB(0x1296db);
      [self.catHealthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(self.nameLabel);
          make.top.equalTo(self.catTypeLabel.mas_bottom).offset(10);

      }];
      self.catHealthLabel.text=@"易得的疾病";
    
    
//    self.catSexLabel =[UILabel new];
//    [bgView addSubview:self.catSexLabel];
//    self.catSexLabel.font=[UIFont systemFontOfSize:13];
//    self.catSexLabel.textColor=ColorWithRGB(0x1296db);
//    [self.catSexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(bgView).offset(15);
//        make.top.equalTo(self.catHealthLabel.mas_bottom).offset(10);
//
//    }];
//    self.catSexLabel.text=@"报价:";
//
    
    
  
    
}

- (void)updataView:(songbaizhangAddCatModel *)model{
    self.nameLabel.text=[NSString stringWithFormat:@"昵称：%@",model.name];
    self.catTypeLabel.text=[NSString stringWithFormat:@"年龄：%@",model.age];
    self.catAgeLabel.text=[NSString stringWithFormat:@"爱吃的食物：%@",model.eafFoot];
    self.catHealthLabel.text=[NSString stringWithFormat:@"易得的疾病：%@",model.easySick];
    self.catImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",model.type]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

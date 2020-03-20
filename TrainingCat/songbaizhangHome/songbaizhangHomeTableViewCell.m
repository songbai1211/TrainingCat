//
//  songbaizhangHomeTableViewCell.m
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangHomeTableViewCell.h"

@interface songbaizhangHomeTableViewCell ()
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *catTypeLabel;
@property(nonatomic,strong)UILabel *catAgeLabel;
@property(nonatomic,strong)UILabel *catHealthLabel;
@property(nonatomic,strong)UILabel *catSexLabel;
@property(nonatomic,strong)UILabel *catMotherLabel;
@property(nonatomic,strong)UILabel *phoneLabel;
@end


@implementation songbaizhangHomeTableViewCell

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
    
    
    self.nameLabel =[UILabel new];
    [bgView addSubview:self.nameLabel];
    self.nameLabel.font=[UIFont boldSystemFontOfSize:16];
    self.nameLabel.textColor=ColorWithRGB(0x1296db);
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(13);
        make.top.equalTo(bgView).offset(13);

    }];
    self.nameLabel.text=@"需要猫咪改正的习惯:";
    
    
    
    self.catTypeLabel =[UILabel new];
      [bgView addSubview:self.catTypeLabel];
      self.catTypeLabel.font=[UIFont systemFontOfSize:13];
      self.catTypeLabel.textColor=ColorWithRGB(0x1296db);
      [self.catTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(bgView).offset(15);
          make.top.equalTo(self.nameLabel.mas_bottom).offset(15);

      }];
      self.catTypeLabel.text=@"猫咪的品种:";
    
    self.catAgeLabel =[UILabel new];
    [bgView addSubview:self.catAgeLabel];
    self.catAgeLabel.font=[UIFont systemFontOfSize:13];
    self.catAgeLabel.textColor=ColorWithRGB(0x1296db);
    [self.catAgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(15);
        make.top.equalTo(self.catTypeLabel.mas_bottom).offset(10);

    }];
    self.catAgeLabel.text=@"猫咪的年龄:";

    
    
    self.catHealthLabel =[UILabel new];
      [bgView addSubview:self.catHealthLabel];
      self.catHealthLabel.font=[UIFont systemFontOfSize:13];
      self.catHealthLabel.textColor=ColorWithRGB(0x1296db);
      [self.catHealthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(bgView).offset(15);
          make.top.equalTo(self.catAgeLabel.mas_bottom).offset(10);

      }];
      self.catHealthLabel.text=@"猫咪身体情况:";
    
    
    self.catSexLabel =[UILabel new];
    [bgView addSubview:self.catSexLabel];
    self.catSexLabel.font=[UIFont systemFontOfSize:13];
    self.catSexLabel.textColor=ColorWithRGB(0x1296db);
    [self.catSexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(15);
        make.top.equalTo(self.catHealthLabel.mas_bottom).offset(10);

    }];
    self.catSexLabel.text=@"猫咪的性别:";
    
    self.catMotherLabel =[UILabel new];
    [bgView addSubview:self.catMotherLabel];
    self.catMotherLabel.font=[UIFont systemFontOfSize:13];
    self.catMotherLabel.textColor=ColorWithRGB(0x1296db);
    [self.catMotherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(15);
        make.top.equalTo(self.catSexLabel.mas_bottom).offset(10);

    }];
    self.catMotherLabel.text=@"看护人:";
    
    
    self.phoneLabel =[UILabel new];
      [bgView addSubview:self.phoneLabel];
      self.phoneLabel.font=[UIFont systemFontOfSize:13];
      self.phoneLabel.textColor=ColorWithRGB(0x1296db);
      [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(bgView).offset(15);
          make.top.equalTo(self.catMotherLabel.mas_bottom).offset(10);

      }];
      self.phoneLabel.text=@"联系电话:";
    
    
    
    
    UIImageView *imageView=[UIImageView new];
    [bgView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bgView.mas_right).offset(-15);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.top.equalTo(bgView).offset(15);
    }];
    imageView.image=[UIImage imageNamed:@"refresh"];
    
    
    
    
    UILabel *mark =[UILabel new];
       [bgView addSubview:mark];
       mark.font=[UIFont systemFontOfSize:12];
       mark.textColor=ColorWithRGB(0xf17c67);
       [mark mas_makeConstraints:^(MASConstraintMaker *make) {
           make.right.equalTo(bgView.mas_right).offset(-15);
           make.top.equalTo(self.catMotherLabel.mas_bottom).offset(10);

       }];
       mark.text=@"等待接受";
    
    
    
    
    
    
}
- (void)updateModel:(songbaizhangHomeModel *)model{
    self.nameLabel.text=[NSString stringWithFormat:@"需要猫咪改正的习惯:  %@",model.catDO];
    self.catTypeLabel.text=[NSString stringWithFormat:@"猫咪的品种:  %@",model.catType];
    self.catAgeLabel.text=[NSString stringWithFormat:@"猫咪的年龄:  %@",model.catAge];
    self.catHealthLabel.text=[NSString stringWithFormat:@"猫咪的身体情况:  %@",model.catHeath];
    self.catSexLabel.text=[NSString stringWithFormat:@"猫咪的性别:  %@",model.catSex];
    self.catMotherLabel.text=[NSString stringWithFormat:@"猫咪的看护人:  %@",model.catMother];
    self.phoneLabel.text=[NSString stringWithFormat:@"猫咪看护人的联系方式:  %@",model.catPhone];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  songbaizhangWrokCatTableViewCell.m
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangWrokCatTableViewCell.h"


@interface songbaizhangWrokCatTableViewCell ()
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *catTypeLabel;
@property(nonatomic,strong)UILabel *catAgeLabel;
@property(nonatomic,strong)UILabel *catHealthLabel;
@property(nonatomic,strong)UILabel *catSexLabel;
@property(nonatomic,strong)UILabel *catMotherLabel;
@property(nonatomic,strong)UILabel *phoneLabel;
@end


@implementation songbaizhangWrokCatTableViewCell

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
    
    UIImageView *imageView=[UIImageView new];
    [bgView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.top.equalTo(bgView).offset(20);
    }];
    imageView.image=[UIImage imageNamed:@"refresh"];
    
    
    self.nameLabel =[UILabel new];
    [bgView addSubview:self.nameLabel];
    self.nameLabel.font=[UIFont boldSystemFontOfSize:16];
    self.nameLabel.textColor=ColorWithRGB(0x1296db);
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(10);
        make.centerY.equalTo(imageView);

    }];
    self.nameLabel.text=@"加菲猫";
    
    
    
    self.catTypeLabel =[UILabel new];
      [bgView addSubview:self.catTypeLabel];
      self.catTypeLabel.font=[UIFont systemFontOfSize:13];
      self.catTypeLabel.textColor=ColorWithRGB(0x1296db);
      [self.catTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(bgView).offset(15);
          make.top.equalTo(self.nameLabel.mas_bottom).offset(15);

      }];
      self.catTypeLabel.text=@"可培养的品种: 英国短毛猫";
    
    self.catAgeLabel =[UILabel new];
    [bgView addSubview:self.catAgeLabel];
    self.catAgeLabel.font=[UIFont systemFontOfSize:13];
    self.catAgeLabel.textColor=ColorWithRGB(0x1296db);
    [self.catAgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(15);
        make.top.equalTo(self.catTypeLabel.mas_bottom).offset(10);

    }];
    self.catAgeLabel.text=@"身体要求:  健康良好";

    
    
    self.catHealthLabel =[UILabel new];
      [bgView addSubview:self.catHealthLabel];
      self.catHealthLabel.font=[UIFont systemFontOfSize:13];
      self.catHealthLabel.textColor=ColorWithRGB(0x1296db);
      [self.catHealthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(bgView).offset(15);
          make.top.equalTo(self.catAgeLabel.mas_bottom).offset(10);

      }];
      self.catHealthLabel.text=@"训练时常:  5天";
    
    
    self.catSexLabel =[UILabel new];
    [bgView addSubview:self.catSexLabel];
    self.catSexLabel.font=[UIFont systemFontOfSize:13];
    self.catSexLabel.textColor=ColorWithRGB(0x1296db);
    [self.catSexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(15);
        make.top.equalTo(self.catHealthLabel.mas_bottom).offset(10);

    }];
    self.catSexLabel.text=@"报价:  240元";
    
    
    
    UILabel *mark =[UILabel new];
       [bgView addSubview:mark];
    mark.backgroundColor=ColorWithRGB(0x1296db);
        mark.layer.cornerRadius=4;
       mark.font=[UIFont systemFontOfSize:12];
       mark.textColor=[UIColor whiteColor];
       [mark mas_makeConstraints:^(MASConstraintMaker *make) {
           make.right.equalTo(bgView.mas_right).offset(-15);
            make.centerY.equalTo(bgView).offset(0);
           make.size.mas_offset(CGSizeMake(60, 30));
       }];
       mark.text=@"申请";
    mark.textAlignment=NSTextAlignmentCenter;
    mark.layer.masksToBounds=YES;
    mark.userInteractionEnabled=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

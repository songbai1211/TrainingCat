//
//  songbaizhangAddMyCatTableViewCell.h
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "songbaizhangAddCatModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^InputData)(songbaizhangAddCatModel *model);

@interface songbaizhangAddMyCatTableViewCell : UITableViewCell
- (void)updataView:(NSString *)data;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UITextField *textFiled;
@property(nonatomic,weak)InputData inputData;

@end

NS_ASSUME_NONNULL_END

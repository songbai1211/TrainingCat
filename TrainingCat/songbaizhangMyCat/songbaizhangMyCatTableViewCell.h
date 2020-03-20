//
//  songbaizhangMyCatTableViewCell.h
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "songbaizhangAddCatModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^DeleDataBlock)(NSInteger row);
@interface songbaizhangMyCatTableViewCell : UITableViewCell
- (void)updataView:(songbaizhangAddCatModel *)model;
@property(nonatomic,copy)DeleDataBlock deleDataBlock;
@end

NS_ASSUME_NONNULL_END

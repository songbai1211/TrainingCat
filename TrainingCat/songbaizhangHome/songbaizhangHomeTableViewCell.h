//
//  songbaizhangHomeTableViewCell.h
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "songbaizhangHomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface songbaizhangHomeTableViewCell : UITableViewCell
- (void)updateModel:(songbaizhangHomeModel*)model;
@end

NS_ASSUME_NONNULL_END

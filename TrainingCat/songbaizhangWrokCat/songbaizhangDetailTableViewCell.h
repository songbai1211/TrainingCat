//
//  songbaizhangDetailTableViewCell.h
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface songbaizhangDetailTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UITextField *textFiled;
- (void)updataView:(NSString *)data;
@end

NS_ASSUME_NONNULL_END

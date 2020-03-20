//
//  songbaizhangPrivateAlterView.h
//  TrainingCat
//
//  Created by crespo on 2020/3/5.
//  Copyright © 2020 crespo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^sureBlock)(NSString *string);

@interface songbaizhangPrivateAlterView : UIView


@property(nonatomic,copy)sureBlock sureClick;

//-(void)withSureClick:(sureBlock)block;
@end

NS_ASSUME_NONNULL_END

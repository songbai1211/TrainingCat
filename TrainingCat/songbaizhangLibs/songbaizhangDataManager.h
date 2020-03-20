//
//  songbaizhangDataManager.h
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface songbaizhangDataManager : NSObject
@property(nonatomic,strong)NSMutableArray *dataArry;
@property(nonatomic,strong)NSMutableArray *catDoDataArry;
@property(nonatomic,strong)NSMutableArray *userDataArry;

@property(nonatomic,assign)BOOL login;
@property(nonatomic,assign)BOOL  agree ;

+(instancetype)shareInstance;
@end

NS_ASSUME_NONNULL_END

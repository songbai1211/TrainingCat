//
//  songbaizhangDataManager.m
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangDataManager.h"


@implementation songbaizhangDataManager

+(instancetype)shareInstance
{
    static songbaizhangDataManager *_singleInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_singleInstance == nil) {
            _singleInstance = [[songbaizhangDataManager alloc]init];
        }
    });
    return _singleInstance;
}

-(instancetype)init
{
    if (self=[super init]) {
        _dataArry=[NSMutableArray new];
        _catDoDataArry=[NSMutableArray new];
    }
    return self;
}
-(NSMutableArray*)dataArry{
    return _dataArry;
}
- (NSMutableArray*)catDoDataArry{
    return _catDoDataArry;
}

- (NSMutableArray*)userDataArry{
    
    NSMutableArray *array=[NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"userDatas"]];
       if (array.count) {
           return array;
       }else{
           array=[NSMutableArray new];
           return array;
       }
}

- (BOOL)login{
 NSString *ret =  [[NSUserDefaults standardUserDefaults]objectForKey:@"login"];
    if ([ret isEqualToString:@"1"]) {
        return YES;
    }
    return NO;
}

- (BOOL)agree{
    NSString *ret =  [[NSUserDefaults standardUserDefaults]objectForKey:@"agree"];
    if ([ret integerValue]==1) {
        return YES;
    }
    return NO;
}

@end

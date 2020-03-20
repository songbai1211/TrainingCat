//
//  AppDelegate.m
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "AppDelegate.h"
#import "songbaizhangLibs/LLTabBar/LLTabBar.h"
#import "songbaizhangHomeViewController.h"
#import "songbaizhangMyCatViewController.h"
#import "songbaizhangWorkCatViewController.h"
#import "songbaizhangMySettingViewController.h"
#import "songbaizhangNAVViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface AppDelegate ()<LLTabBarDelegate>
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    AFNetworkReachabilityManager *netManager = [AFNetworkReachabilityManager sharedManager];
    [netManager startMonitoring];  //开始监听
    [netManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        
        if (status == AFNetworkReachabilityStatusNotReachable)
        {
            return;
        }else if (status == AFNetworkReachabilityStatusUnknown){
            
            
        }else if ((status == AFNetworkReachabilityStatusReachableViaWWAN)||(status == AFNetworkReachabilityStatusReachableViaWiFi)){
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"updateNetWork" object:nil];
        }
        
    }];
    
    [self initTabbatView];
    return YES;
}

-(void)initTabbatView{
     
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    songbaizhangHomeViewController *homeVC=[songbaizhangHomeViewController new];
    songbaizhangWorkCatViewController *workCatVC=[songbaizhangWorkCatViewController new];
    songbaizhangMyCatViewController *myCatVC=[songbaizhangMyCatViewController new];
    songbaizhangMySettingViewController *settingVC=[songbaizhangMySettingViewController new];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[[[songbaizhangNAVViewController alloc]initWithRootViewController:homeVC], [[songbaizhangNAVViewController alloc]initWithRootViewController:workCatVC], [[songbaizhangNAVViewController alloc]initWithRootViewController:myCatVC], [[songbaizhangNAVViewController alloc]initWithRootViewController:settingVC]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    LLTabBar *tabBar=[[LLTabBar alloc]initWithFrame:tabBarController.tabBar.bounds];
    
    tabBar.tabBarItemAttributes = @[
                                        @{kLLTabBarItemAttributeTitle : @"训练喵咪", kLLTabBarItemAttributeNormalImageName : @"home", kLLTabBarItemAttributeSelectedImageName : @"home", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                    
                                       @{kLLTabBarItemAttributeTitle : @"工作猫", kLLTabBarItemAttributeNormalImageName : @"workcat", kLLTabBarItemAttributeSelectedImageName : @"workcat", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                    
                                       @{kLLTabBarItemAttributeTitle : @"添加", kLLTabBarItemAttributeNormalImageName : @"add", kLLTabBarItemAttributeSelectedImageName : @"add", kLLTabBarItemAttributeType : @(LLTabBarItemRise)},
                                    
                                       @{kLLTabBarItemAttributeTitle : @"我的猫咪", kLLTabBarItemAttributeNormalImageName : @"mycat", kLLTabBarItemAttributeSelectedImageName : @"mycat", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                    
                                       @{kLLTabBarItemAttributeTitle : @"设置", kLLTabBarItemAttributeNormalImageName : @"setting", kLLTabBarItemAttributeSelectedImageName : @"setting", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)}];

    
    
    
    tabBar.delegate = self;
    [tabBarController.tabBar addSubview:tabBar];
    
    self.window.rootViewController = tabBarController;
    
    [UINavigationBar.appearance setTitleTextAttributes:@{
    NSFontAttributeName:[UIFont boldSystemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance] setBarTintColor:ColorWithRGB(0x1296db)];

    
    
}


#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex = %ld", buttonIndex);
    if (buttonIndex==0) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"goDetail" object:nil];
    }
}

#pragma mark - LLTabBarDelegate

- (void)tabBarDidSelectedRiseButton {
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UIViewController *viewController = tabBarController.selectedViewController;
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"添加需要训练的猫咪", nil];
    [actionSheet showInView:viewController.view];
}

#pragma mark - UISceneSession lifecycle


@end

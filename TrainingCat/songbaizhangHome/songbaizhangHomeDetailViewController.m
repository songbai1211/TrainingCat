//
//  songbaizhangHomeDetailViewController.m
//  TrainingCat
//
//  Created by crespo on 2020/3/9.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangHomeDetailViewController.h"

@interface songbaizhangHomeDetailViewController ()

@end

@implementation songbaizhangHomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
         self.navigationItem.title=@"猫咪详情";
    self.view.backgroundColor=[UIColor whiteColor];
       self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self initView];
}
- (void)initView{
    
    
    UIImageView *bgImageView=[UIImageView new];
    [self.view addSubview:bgImageView];
    bgImageView.contentMode=UIViewContentModeScaleAspectFill;
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(120);
        make.size.mas_equalTo(200);
    }];
 
    
    bgImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",self.model.catType]];
    
    UITextView *label=[UITextView new];
    [self.view addSubview:label];
//    label.numberOfLines=0;
    label.backgroundColor=[UIColor clearColor];
    label.textColor=[UIColor grayColor];
    label.font=[UIFont systemFontOfSize:16];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.top.equalTo(bgImageView.mas_bottom).offset(70);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];
    
    NSMutableString *string = [NSMutableString new];
    [string appendFormat:@"%@", [NSString stringWithFormat:@"需要猫咪改正的习惯:  %@",self.model.catDO]];
    [string appendFormat:@"\n\n\n%@", [NSString stringWithFormat:@"猫咪的品种:  %@",self.model.catType]];
    [string appendFormat:@"\n\n\n%@", [NSString stringWithFormat:@"猫咪的年龄:  %@",self.model.catAge]];
    [string appendFormat:@"\n\n\n%@", [NSString stringWithFormat:@"猫咪的身体情况:  %@",self.model.catHeath]];
    [string appendFormat:@"\n\n\n%@", [NSString stringWithFormat:@"猫咪的性别:  %@",self.model.catSex]];
    [string appendFormat:@"\n\n\n%@", [NSString stringWithFormat:@"猫咪的看护人:  %@",self.model.catMother]];
     [string appendFormat:@"\n\n\n%@", [NSString stringWithFormat:@"猫咪看护人的联系方式:  %@",self.model.catPhone]];
    label.text=[NSString stringWithFormat:@"%@",string];
    
    
    
    UIButton *shareButton = [UIButton buttonWithType:0];
    [self.view addSubview:shareButton];
    shareButton.layer.cornerRadius=30;
    shareButton.layer.masksToBounds=YES;
    [shareButton setTitle:@"分享" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    shareButton.backgroundColor=ColorWithRGB(0x1296db);
    [shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [shareButton addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
}
-(void)share{
    NSMutableString *string = [NSMutableString new];
    [string appendFormat:@"%@", [NSString stringWithFormat:@"需要猫咪改正的习惯:  %@",self.model.catDO]];
    [string appendFormat:@"\n\n\n%@", [NSString stringWithFormat:@"猫咪的品种:  %@",self.model.catType]];
    [string appendFormat:@"\n\n\n%@", [NSString stringWithFormat:@"猫咪的年龄:  %@",self.model.catAge]];
    [string appendFormat:@"\n\n\n%@", [NSString stringWithFormat:@"猫咪的身体情况:  %@",self.model.catHeath]];
    [string appendFormat:@"\n\n\n%@", [NSString stringWithFormat:@"猫咪的性别:  %@",self.model.catSex]];
    [string appendFormat:@"\n\n\n%@", [NSString stringWithFormat:@"猫咪的看护人:  %@",self.model.catMother]];
     [string appendFormat:@"\n\n\n%@", [NSString stringWithFormat:@"猫咪看护人的联系方式:  %@",self.model.catPhone]];
    
    NSString * shareText =string;
    UIImage * shareImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",self.model.catType]];;
      NSURL * shareURL = [NSURL URLWithString:@"https://www.bagong.cn/cat/"];
      NSArray * activityItems = [[NSArray alloc] initWithObjects:shareText, shareImage, shareURL, nil];
      UIActivityViewController * activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
      UIActivityViewControllerCompletionWithItemsHandler myBlock = ^(UIActivityType activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
                NSLog(@"%@",activityType);
                if (completed) {
                    NSLog(@"分享成功");
                } else {
                    NSLog(@"分享失败");
                }
      [activityVC dismissViewControllerAnimated:YES completion:nil];
            };
       activityVC.completionWithItemsHandler = myBlock;
    [self presentViewController:activityVC animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

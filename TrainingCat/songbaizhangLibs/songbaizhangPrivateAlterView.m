//
//  songbaizhangPrivateAlterView.m
//  TrainingCat
//
//  Created by crespo on 2020/3/5.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangPrivateAlterView.h"
#import <WebKit/WebKit.h>
#define alter_height ScreenHeight/3
#define alter_width  ScreenWidth-50

@interface songbaizhangPrivateAlterView ()
@property(nonatomic,strong)UIView *privateAlertView;
@property (nonatomic, strong) UITextView *textView;
@end

@implementation songbaizhangPrivateAlterView

-(instancetype) initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = [UIScreen mainScreen].bounds;
        self.privateAlertView = [[UIView alloc]initWithFrame:CGRectMake(0,0,ScreenWidth, ScreenHeight)];
        self.privateAlertView.center = self.center;
        self.privateAlertView.backgroundColor = [UIColor whiteColor];
        self.privateAlertView.layer.cornerRadius=5.0;
        self.privateAlertView.layer.masksToBounds=YES;
        self.privateAlertView.userInteractionEnabled=YES;
        [self addSubview:self.privateAlertView];
        
     __block   WKWebView *webView = [[WKWebView alloc]initWithFrame:self.bounds configuration:[WKWebViewConfiguration new]];
               [self addSubview:webView];
               [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://guanzejinshu.com/private.html"]]];
               webView.backgroundColor = UIColor.whiteColor;
        
        [[NSNotificationCenter defaultCenter]addObserverForName:@"updateNetWork" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            [webView reload];
        }];
        
       
        
        UIButton *cancelBtn= [[UIButton alloc]initWithFrame:CGRectMake(20, ScreenHeight - 60, self.privateAlertView.frame.size.width/3., 35)];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setBackgroundColor:ColorWithRGB(0xd0dbdf)];
        cancelBtn.layer.cornerRadius=3.0;
        cancelBtn.layer.masksToBounds=YES;
        [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancelBtn];
        
        UIButton *sureBtn= [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth-150, ScreenHeight - 60, self.privateAlertView.frame.size.width/3., 35)];
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [sureBtn setBackgroundColor:ColorWithRGB(0x1296db)];
        sureBtn.layer.cornerRadius=3.0;
        sureBtn.layer.masksToBounds=YES;
        [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(agreeClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sureBtn];
        
        
    }
    [self showAnimation];
    return self;
}




-(void)showAnimation{
    
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];

    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    self.privateAlertView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.privateAlertView.alpha = 0;
    [UIView animateWithDuration:0.2 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4f];
        self.privateAlertView.transform = transform;
        self.privateAlertView.alpha = 1;
    } completion:^(BOOL finished) {

    }];
}

-(void)agreeClick{
     [UIView animateWithDuration:0.3 animations:^{
      [self removeFromSuperview];
     }];
      
      [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"agree"];
      [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void)cancelClick:(UIButton *)sender{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
     hud.mode = MBProgressHUDModeText;
     hud.label.text = @"点击同意才能使用APP";
     [hud hideAnimated:YES afterDelay:1];
}


@end

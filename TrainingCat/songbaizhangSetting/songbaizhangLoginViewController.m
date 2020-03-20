//
//  songbaizhangLoginViewController.m
//  TrainingCat
//
//  Created by crespo on 2020/3/4.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangLoginViewController.h"
#import "songbaizhangLoginView.h"
#import "TrainingCat-Swift.h"
@interface songbaizhangLoginViewController ()
@property(nonatomic,strong)UITextField*account;

@property(nonatomic,strong) UITextField*password;
@property(nonatomic,strong) songbaizhangLoginView *background;

@property(nonatomic,strong) UIButton*loginButton;
@property(nonatomic,strong) UIButton* zhuceButton;

@end

@implementation songbaizhangLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self.view setBackgroundColor:[UIColor colorWithRed:51/255.0 green:204/255.0 blue:255/255.0 alpha:1]];

    
    UIImageView *imageView=[UIImageView new];
      [self.view addSubview:imageView];
      [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.centerX.equalTo(self.view);
          make.size.mas_equalTo(CGSizeMake(50, 50));
          make.top.equalTo(self.view).offset(70);
      }];
      imageView.image=[UIImage imageNamed:@"refresh"];
    
   _background=[[songbaizhangLoginView alloc]initWithFrame:CGRectMake(40,200,self.view.frame.size.width-80,100)];

    [_background setBackgroundColor:[UIColor whiteColor]];

    [[_background layer]setCornerRadius:5];

    [[_background layer]setMasksToBounds:YES];

    [self.view addSubview:_background];
    
    
    
  
    
    

    _account=[[UITextField alloc]initWithFrame:CGRectMake(10,0,self.view.frame.size.width-40,50)];
    [_account setBackgroundColor:[UIColor clearColor]];
    _account.placeholder=[NSString stringWithFormat:@"用户名"];
    _account.layer.cornerRadius=5.0;
    [_background addSubview:_account];

    _password=[[UITextField alloc]initWithFrame:CGRectMake(10,50,self.view.frame.size.width-40,50)];
    [_password setBackgroundColor:[UIColor clearColor]];
    _password.layer.cornerRadius=5.0;
    _password.placeholder=[NSString stringWithFormat:@"密码"];
    [_background addSubview:_password];


    
    
    
    _loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setFrame:CGRectMake(40,320,self.view.frame.size.width-80,50)];
    [_loginButton setTitle:@"登陆"forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    [_loginButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [self.view addSubview:_loginButton];
    [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    
        self.zhuceButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
       [self.zhuceButton setFrame:CGRectMake(self.view.frame.size.width-80-40,320+70,90,30)];
       [self.zhuceButton setTitle:@"去注册"forState:UIControlStateNormal];
//       [self.zhuceButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
       [self.zhuceButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
       [self.view addSubview:self.zhuceButton];
       [self.zhuceButton addTarget:self action:@selector(zhuce) forControlEvents:UIControlEventTouchUpInside];
        
    
}

-(void)zhuce{
    
    RegisterViewController *vc=[RegisterViewController new];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
}
-(void)login{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
           hud.mode = MBProgressHUDModeIndeterminate;
    
    if (self.account.text.length==0 || self.password.text.length ==0) {
        hud.label.text = @"用户名密码不能为空";
    }else{
       __block BOOL isOK;
        [[songbaizhangDataManager shareInstance].userDataArry enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([self.account.text isEqualToString:obj[@"user"]] && [self.password.text isEqualToString:obj[@"password"]]) {
                isOK = YES;
                *stop =YES;
            }
        }];
        
        if (([self.account.text isEqualToString:@"crespo"]&&[self.password.text isEqualToString:@"123456"])|| isOK ) {
            [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"login"];
             [[NSUserDefaults standardUserDefaults]synchronize];
             [self dismissViewControllerAnimated:YES completion:nil];
             hud.label.text = @"登陆成功";
        }else{
            hud.label.text = @"用户名或密码不对";
        }
    }
    
    [hud hideAnimated:YES afterDelay:1];
    
 
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

//
//  songbaizhangMyCatViewController.m
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangMySettingViewController.h"
#import "songbaizhangSettingTableViewCell.h"
#import "songbaizhangAboutAPPViewController.h"
#import "songbaizhangLoginViewController.h"
#import "JCChoosePhoneManager.h"
#import "SelectPhotoManager.h"
#import "TrainingCat-Swift.h"

@interface songbaizhangMySettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *mainTableView;
@property(nonatomic,strong)UIButton *loginOutbtn;
@property (nonatomic, strong)SelectPhotoManager *photoManager;
@property(nonatomic,strong)UIButton *cancleButton;
@end

@implementation songbaizhangMySettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"设置";
    [self initView];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([songbaizhangDataManager shareInstance].login==YES) {
        self.loginOutbtn.hidden = NO;
        
    }else{
        self.loginOutbtn.hidden = YES;
    }
    [self.mainTableView reloadData];
}
-(void)initView{
    self.mainTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.mainTableView.delegate=self;
    self.mainTableView.dataSource=self;
    [self.view addSubview:self.mainTableView];
    self.mainTableView.rowHeight=45;
    self.mainTableView.backgroundColor=[UIColor whiteColor];

    [self.mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.mainTableView registerClass:[songbaizhangSettingTableViewCell class] forCellReuseIdentifier:@"songbaizhangSettingTableViewCell"];

    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.mainTableView.tableFooterView=[UIView new];
    
    self.loginOutbtn=[UIButton buttonWithType:0];
    [self.view addSubview:self.loginOutbtn];
    self.loginOutbtn.layer.cornerRadius = 8;
    self.loginOutbtn.layer.masksToBounds = true;
    [self.loginOutbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 50));
        make.bottom.equalTo(self.view.mas_bottom).offset(-200);
    }];
    self.loginOutbtn.backgroundColor=ColorWithRGB(0x1296db);
    [self.loginOutbtn setTitle:@"退出登陆" forState:UIControlStateNormal];
    [self.loginOutbtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    
    [self.loginOutbtn addTarget:self action:@selector(loginout) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.cancleButton setTitle:@"修改昵称" forState:UIControlStateNormal];
    [self.cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.cancleButton addTarget:self action:@selector(changeName) forControlEvents:UIControlEventTouchUpInside];
        
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:self.cancleButton];
    rightItem.imageInsets = UIEdgeInsetsMake(0, -15,0, 0);//设置向左偏移
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)changeName{
    
    if (![songbaizhangDataManager shareInstance].login) {
           songbaizhangLoginViewController *login=[songbaizhangLoginViewController new];
           [self.navigationController presentViewController:login animated:YES completion:nil];
           return;
             
       }
    
    songbaizhangChangeNameViewController *vc=[songbaizhangChangeNameViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)loginout{
    [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"login"];
     [[NSUserDefaults standardUserDefaults]synchronize];
     songbaizhangLoginViewController *login=[songbaizhangLoginViewController new];
     [self.navigationController presentViewController:login animated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row ==0) {
        
        [self openCamear];
    }else
    if (indexPath.row==1) {
        songbaizhangAboutAPPViewController *vc=[songbaizhangAboutAPPViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
       
        if (indexPath.row == 2) {
            peopleRureViewController *vc =[peopleRureViewController new];
           vc.hidesBottomBarWhenPushed = YES;
           [self.navigationController pushViewController:vc animated:YES];
        }else{
            PrivateViewController *vc =[PrivateViewController new];
           vc.hidesBottomBarWhenPushed = YES;
           [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return 80;
    }else{
        return 46;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   

    
    if (indexPath.row ==0) {
        songbaizhangSettingTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"songbaizhangSettingTableViewCell"];
           cell.backgroundColor=[UIColor whiteColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        UIImage *img = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"myheaderImage"]];
        if (img) {
            cell.logoImageVIew.image =img;
        }else{
            cell.logoImageVIew.image =[UIImage imageNamed:@"icon"];
        }
        NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:@"nickname"];
        if (userName.length) {
            cell.nameLabel.text=userName;
        }else{
            cell.nameLabel.text=@"猫咪主人";
        }
        
        return cell;
    }else{
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor=ColorWithRGB(0x1296db);//16c71b
        cell.textLabel.font=[UIFont systemFontOfSize:14];
        if (indexPath.row==1) {
            cell.textLabel.text=@"关于APP";
            cell.imageView.image=[UIImage imageNamed:@"guanyu"];
        }else if (indexPath.row==2){
            cell.textLabel.text=@"用户协议";
            cell.imageView.image=[UIImage imageNamed:@"xieyi"];
        }else if (indexPath.row == 3){
            cell.textLabel.text=@"隐私政策";
            cell.imageView.image=[UIImage imageNamed:@"yinsi"];

        }
        return cell;
    }
    
    
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}



-(void)openCamear{
    
    if (![songbaizhangDataManager shareInstance].login) {
        songbaizhangLoginViewController *login=[songbaizhangLoginViewController new];
        [self.navigationController presentViewController:login animated:YES completion:nil];
        return;
          
    }
    
    self.photoManager =[[SelectPhotoManager alloc]init];
    [self.photoManager startSelectPhotoWithImageName:@"选择喜欢的头像"];
    //选取照片成功
    self.photoManager.successHandle=^(SelectPhotoManager *manager,UIImage *image){
        //保存到本地
        NSData *data = UIImagePNGRepresentation(image);
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"myheaderImage"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [self.mainTableView reloadData];
    };
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

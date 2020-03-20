//
//  songbaizhangworkDetailViewController.m
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangworkDetailViewController.h"
#import "songbaizhangDetailTableViewCell.h"
@interface songbaizhangworkDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *mainTableView;
@property(nonatomic,strong)NSArray *dataArry;
@property(nonatomic,strong)NSString *haveCat;
@property(nonatomic,strong)NSString *catTime;
@property(nonatomic,strong)NSString *people;
@property(nonatomic,strong)NSString *phone;

@end

@implementation songbaizhangworkDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=ColorWithRGB(0xf5f5f5);
      self.navigationItem.title=@"申请培养";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.dataArry=@[@"拥有的猫咪",@"工作时间",@"通知人",@"联系方式"];
      [self initView];
    // Do any additional setup after loading the view.
}
-(void)initView{
    self.mainTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.mainTableView.delegate=self;
    self.mainTableView.dataSource=self;
    [self.view addSubview:self.mainTableView];
    self.mainTableView.backgroundColor=ColorWithRGB(0xf5f5f5);
    self.mainTableView.rowHeight=60;
    self.mainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.mainTableView registerClass:[songbaizhangDetailTableViewCell class] forCellReuseIdentifier:@"songbaizhangDetailTableViewCell"];
    self.mainTableView.tableFooterView=[UIView new];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view);
        make.height.mas_equalTo(350);
    }];
    
    UIButton *btn=[UIButton buttonWithType:0];
    [self.view addSubview:btn];
    [btn setTitle:@"申请" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:ColorWithRGB(0x1296db)];
    btn.layer.cornerRadius=8;
    btn.layer.masksToBounds=YES;
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainTableView.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(300, 45));
        make.centerX.equalTo(self.view);
    }];
    [btn addTarget:self action:@selector(ok) forControlEvents:UIControlEventTouchUpInside];
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldEditing:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)ok{
    if (self.haveCat.length==0 || self.catTime.length==0 ||self.people.length==0||self.phone.length==0) {
        //只显示文字
          MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
          hud.mode = MBProgressHUDModeIndeterminate;
          hud.label.text = @"信息不能为空";
          [hud hideAnimated:YES afterDelay:1];
          return;
      }


    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = @"申请成功";
        [hud hideAnimated:YES afterDelay:1];
        [self.navigationController popViewControllerAnimated:YES];

    });
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    songbaizhangDetailTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"songbaizhangDetailTableViewCell"];
    [cell updataView:self.dataArry[indexPath.row]];
    cell.textFiled.tag=indexPath.row;
    cell.selectionStyle=0;
    return cell;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (void)textFieldEditing:(NSNotification *)info{
    
    UITextField *textField = (UITextField *)info.object;
    if (textField.tag==0) {
        self.haveCat=textField.text;
    }else if (textField.tag==1){
        self.catTime=textField.text;
    }else if (textField.tag==2){
        self.people=textField.text;
    }else{
        self.phone=textField.text;
    }
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

//
//  songbaizhangAddDoCatViewController.m
//  TrainingCat
//
//  Created by crespo on 2020/3/5.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangAddDoCatViewController.h"
#import "songbaizhangAddMyCatTableViewCell.h"
#import "songbaizhangAddCatModel.h"
#import "songbaizhangHomeModel.h"
#import "CDZPicker.h"

@interface songbaizhangAddDoCatViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong)UITableView *mainTableView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)songbaizhangHomeModel *model;
@property(nonatomic,strong)UIPickerView *pickerView;
@property(nonatomic,strong)NSArray *dataSouce;
@end

@implementation songbaizhangAddDoCatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model=[songbaizhangHomeModel new];
    self.view.backgroundColor=ColorWithRGB(0xf5f5f5);
      self.navigationItem.title=@"猫咪详情";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.titleArray=@[@"需要矫正的习惯",@"猫咪的品种",@"猫咪的年龄",@"猫咪的身体状况",@"性别",@"看护人",@"联系方式"];
      [self initView];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    self.mainTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
  self.dataSouce = @[@"美国短毛猫",@"英国短毛猫",@"缅甸猫",@"暹罗猫",@"埃及猫",@"伯曼猫",@"布偶猫",@"东奇尼猫",
                     @"暹罗猫",@"金吉拉",@"卡尔特猫",@"美国卷耳猫",@"异国猫",@"中国狸花猫",@"雪血猫",@"苏格兰折耳猫",@"缅因猫",@"喜马拉雅猫"];
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)initView{
    self.mainTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.mainTableView.delegate=self;
    self.mainTableView.dataSource=self;
    [self.view addSubview:self.mainTableView];
    self.mainTableView.backgroundColor=ColorWithRGB(0xf5f5f5);
    self.mainTableView.rowHeight=60;
    self.mainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.mainTableView registerClass:[songbaizhangAddMyCatTableViewCell class] forCellReuseIdentifier:@"songbaizhangAddMyCatTableViewCell"];
    self.mainTableView.tableFooterView=[UIView new];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view);
        make.height.mas_equalTo(520);
    }];
    
    UIButton *btn=[UIButton buttonWithType:0];
    [self.view addSubview:btn];
    [btn setTitle:@"增加我的猫咪" forState:UIControlStateNormal];
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
    
    if (self.model.catDO.length==0 || self.model.catAge.length==0 ||self.model.catType.length==0||self.model.catMother.length==0 ||self.model.catPhone.length==0) {
      //只显示文字
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = @"信息不能为空";
        [hud hideAnimated:YES afterDelay:1];
        return;
    }
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      
        [[NSNotificationCenter defaultCenter]postNotificationName:@"updateData" object:self.model];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = @"添加成功";
        [hud hideAnimated:YES afterDelay:1];
        [self.navigationController popViewControllerAnimated:YES];
    });
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    songbaizhangAddMyCatTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"songbaizhangAddMyCatTableViewCell"];
    [cell updataView:self.titleArray[indexPath.row]];
    cell.textFiled.tag=indexPath.row;
    if (indexPath.row ==1) {
        cell.textFiled.enabled= NO;
    }else{
        cell.textFiled.enabled= YES;
    }
    cell.selectionStyle=0;
    return cell;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
//        [textField becomeFirstResponder];
        songbaizhangAddMyCatTableViewCell *cell=(songbaizhangAddMyCatTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];//获取具体位置的cell

        [self.view endEditing:YES];
        [CDZPicker showPickerInView:self.view withStrings:self.dataSouce confirm:^(NSArray<NSString *> *stringArray) {
            cell.textFiled.text=[NSString stringWithFormat:@"%@",stringArray.firstObject];
            self.model.catType = cell.textFiled.text;
               } cancel:^{
               }];
                               
    }
}
- (void)textFieldEditing:(NSNotification *)info{
    
    UITextField *textField = (UITextField *)info.object;
    if (textField.tag==0) {
        self.model.catDO=textField.text;
    }else if (textField.tag==1){
       
//        self.model.catType=textField.text;
    }else if (textField.tag==2){
        self.model.catAge=textField.text;
    }else if (textField.tag==3){
        self.model.catHeath=textField.text;
    }else if (textField.tag==4){
        self.model.catSex=textField.text;
    }else if (textField.tag==5){
        self.model.catMother=textField.text;
    }
    else{
        self.model.catPhone=textField.text;
    }

}


//@property(nonatomic,copy)NSString *catDO;
//
//@property(nonatomic,copy)NSString *catType;
//@property(nonatomic,copy)NSString *catAge;
//@property(nonatomic,copy)NSString *catHeath;
//@property(nonatomic,copy)NSString *catSex;
//@property(nonatomic,copy)NSString *catPhone;
//@property(nonatomic,copy)NSString *catMother;
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

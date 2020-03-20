//
//  songbaizhangHomeViewController.m
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangHomeViewController.h"
#import "songbaizhangHomeTableViewCell.h"
#import "songbaizhangAddMyCatViewController.h"
#import "songbaizhangHomeModel.h"
#import "songbaizhangLoginViewController.h"
#import <SafariServices/SafariServices.h>
#import "songbaizhangPrivateAlterView.h"
#import "songbaizhangAddDoCatViewController.h"
#import "songbaizhangHomeDetailViewController.h"
#import "TrainingCat-Swift.h"
#import <JXPatternLock-Swift.h>
@interface songbaizhangHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *mainTableView;
@property(nonatomic,strong)NSMutableArray *dataArry;

@end

@implementation songbaizhangHomeViewController

-(void)loadData{
    songbaizhangHomeModel *model1=[songbaizhangHomeModel new];
    model1.catDO=@"乱撒尿";
    model1.catType=@"英国短毛猫";
    model1.catAge=@"2岁";
    model1.catHeath=@"良好";
    model1.catSex=@"母";
    model1.catMother=@"张松柏";
    model1.catPhone=@"13155064532";
    [self.dataArry addObject:model1];
    
    
    
    songbaizhangHomeModel *model2=[songbaizhangHomeModel new];
    model2.catDO=@"乱拉屎";
    model2.catType=@"暹罗猫";
    model2.catAge=@"2岁";
    model2.catHeath=@"良好";
    model2.catSex=@"母";
    model2.catMother=@"归之至";
    model2.catPhone=@"13633453422";
    [self.dataArry addObject:model2];
    
    
    
    songbaizhangHomeModel *model3=[songbaizhangHomeModel new];
    model3.catDO=@"不好好吃饭";
      model3.catType=@"布偶猫";
      model3.catAge=@"3岁";
      model3.catHeath=@"一般";
      model3.catSex=@"公";
      model3.catMother=@"w王凯凯";
      model3.catPhone=@"168343432434";
      [self.dataArry addObject:model3];
    
    songbaizhangHomeModel *model4=[songbaizhangHomeModel new];
    model4.catDO=@"经常到处跑跳";
      model4.catType=@"金吉拉";
      model4.catAge=@"5个月";
      model4.catHeath=@"好";
      model4.catSex=@"母";
      model4.catMother=@"吴飞";
      model4.catPhone=@"13433212345";
      [self.dataArry addObject:model2];
    
    
    songbaizhangHomeModel *model5=[songbaizhangHomeModel new];
      model5.catType=@"美国短毛猫";
    model5.catDO=@"整天睡觉";
      model5.catAge=@"5岁";
      model5.catHeath=@"不好";
      model5.catSex=@"母";
      model5.catMother=@"刘物语";
      model5.catPhone=@"15122341342";
      [self.dataArry addObject:model5];
    
    
    
    
    songbaizhangHomeModel *model6=[songbaizhangHomeModel new];
      model6.catDO=@"乱拉屎";
      model6.catType=@"西伯利亚猫";
      model6.catAge=@"2.5岁";
      model6.catHeath=@"良好";
      model6.catSex=@"母";
      model6.catMother=@"张文超";
      model6.catPhone=@"13233453422";
      [self.dataArry addObject:model6];
      
      
      
      songbaizhangHomeModel *model7=[songbaizhangHomeModel new];
      model7.catDO=@"不好好吃饭";
        model7.catType=@"中国狸花猫";
        model7.catAge=@"1岁";
        model7.catHeath=@"一般";
        model7.catSex=@"公";
        model7.catMother=@"李亮亮";
        model7.catPhone=@"158343432434";
        [self.dataArry addObject:model7];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"训练猫咪";
    self.dataArry=[NSMutableArray new];
    [self loadData];

    // Do any additional setup after loading the view.
    [self initView];
    
    [[NSNotificationCenter defaultCenter]addObserverForName:@"goDetail" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        if ([songbaizhangDataManager shareInstance].login) {
            self.tabBarController.selectedIndex=0;
            songbaizhangAddDoCatViewController *detail=[songbaizhangAddDoCatViewController new];
            detail.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:detail animated:YES];
            
        }else{
            songbaizhangLoginViewController *login=[songbaizhangLoginViewController new];
              [self.navigationController presentViewController:login animated:YES completion:nil];
        }
        
        
    }];
    
    if (![songbaizhangDataManager shareInstance].agree) {
        songbaizhangPrivateAlterView *priviewView=[songbaizhangPrivateAlterView new];
    }
    
    
    [[NSNotificationCenter defaultCenter]addObserverForName:@"updateData" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        songbaizhangHomeModel *model=(songbaizhangHomeModel*)note.object;
        [self.dataArry insertObject:model atIndex:0];
        [self loadNewData];
    }];
    
}
- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller

{
    //[self.navigationController popViewControllerAnimated:YES];
}
-(void)initView{
    self.mainTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.mainTableView.delegate=self;
    self.mainTableView.dataSource=self;
    [self.view addSubview:self.mainTableView];
    self.mainTableView.rowHeight=230;
    self.mainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.mainTableView registerClass:[songbaizhangHomeTableViewCell class] forCellReuseIdentifier:@"songbaizhangHomeTableViewCell"];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    NSMutableArray *arry=[NSMutableArray new];
     [arry addObject:[UIImage imageNamed:@"refresh"]];
     

    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
       [header setImages:arry forState:MJRefreshStateIdle];
       [header setImages:arry forState:MJRefreshStatePulling];
       [header setImages:arry forState:MJRefreshStateRefreshing];
       self.mainTableView.mj_header = header;
    [self loadNewData];

}

- (void)loadNewData{
    [self.mainTableView.mj_header beginRefreshing];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.mainTableView.mj_header endRefreshing];
        [self.mainTableView.mj_footer resetNoMoreData];
        self.mainTableView.mj_footer.state = MJRefreshStateNoMoreData;
        [self.mainTableView reloadData];
    });
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    songbaizhangHomeDetailViewController *vc=[songbaizhangHomeDetailViewController new];
    vc.model = self.dataArry[indexPath.row];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    songbaizhangHomeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"songbaizhangHomeTableViewCell"];
    [cell updateModel:self.dataArry[indexPath.row]];
    cell.selectionStyle=0;
    cell.selectionStyle=0;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArry.count;
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

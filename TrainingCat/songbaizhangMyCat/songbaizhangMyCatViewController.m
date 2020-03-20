//
//  songbaizhangSettingViewController.m
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangMyCatViewController.h"
#import "songbaizhangMyCatTableViewCell.h"
#import "songbaizhangAddMyCatViewController.h"
#import "songbaizhangAddCatModel.h"
#import "songbaizhangDataManager.h"
#import "LYEmptyViewHeader.h"
#import "songbaizhangMYCatDetailViewController.h"
@interface songbaizhangMyCatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *mainTableView;
@property(nonatomic,strong)UILabel *empytLabel;

@end

@implementation songbaizhangMyCatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"我的猫咪";
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancleButton setTitle:@"添加" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(cancleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:cancleButton];
    rightItem.imageInsets = UIEdgeInsetsMake(0, -15,0, 0);//设置向左偏移
    self.navigationItem.rightBarButtonItem = rightItem;
    // Do any additional setup after loading the view.
}

- (void)cancleButtonClicked{
    songbaizhangAddMyCatViewController *vc=[songbaizhangAddMyCatViewController new];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initView];
   
}

-(void)initView{
    self.mainTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.mainTableView.delegate=self;
    self.mainTableView.dataSource=self;
    [self.view addSubview:self.mainTableView];
    self.mainTableView.rowHeight=110;
    self.mainTableView.separatorStyle=0;
    self.mainTableView.tableFooterView=[UIView new];
    self.mainTableView.backgroundColor=ColorWithRGB(0xf5f5f5);
    [self.mainTableView registerClass:[songbaizhangMyCatTableViewCell class] forCellReuseIdentifier:@"songbaizhangMyCatTableViewCell"];
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
    
    MJRefreshFooter *footer=[MJRefreshFooter footerWithRefreshingBlock:^{
        
    }];
    self.mainTableView.mj_footer=footer;
    [self.mainTableView.mj_header beginRefreshing];

    self.mainTableView.ly_emptyView=[LYEmptyView emptyViewWithImageStr:@"empty"
        titleStr:@"点击右上角添加您的猫咪"
       detailStr:nil];
}

- (void)loadNewData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.mainTableView.mj_header endRefreshing];
        [self.mainTableView reloadData];
    });
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    songbaizhangMYCatDetailViewController *vc=[songbaizhangMYCatDetailViewController new];
    vc.hidesBottomBarWhenPushed=YES;
    vc.model=[songbaizhangDataManager shareInstance].dataArry[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    songbaizhangMyCatTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"songbaizhangMyCatTableViewCell"];
    cell.deleDataBlock = ^(NSInteger row) {
        [[songbaizhangDataManager shareInstance].dataArry removeObjectAtIndex:indexPath.row];
        [self.mainTableView reloadData];
    };
    cell.selectionStyle=0;
    [cell updataView:[songbaizhangDataManager shareInstance].dataArry [indexPath.row]];
    return cell;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [songbaizhangDataManager shareInstance].dataArry .count;
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

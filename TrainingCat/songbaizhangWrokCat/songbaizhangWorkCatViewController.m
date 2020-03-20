//
//  songbaizhangWorkCatViewController.m
//  TrainingCat
//
//  Created by crespo on 2020/3/3.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangWorkCatViewController.h"
#import "songbaizhangWrokCatTableViewCell.h"
#import "songbaizhangworkDetailViewController.h"
@interface songbaizhangWorkCatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *mainTableView;

@end

@implementation songbaizhangWorkCatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"工作猫咪";
    [self initView];
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)initView{
    self.mainTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.mainTableView.delegate=self;
    self.mainTableView.dataSource=self;
    [self.view addSubview:self.mainTableView];
    self.mainTableView.rowHeight=180;
    self.mainTableView.backgroundColor=ColorWithRGB(0xf5f5f5);
    self.mainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.mainTableView registerClass:[songbaizhangWrokCatTableViewCell class] forCellReuseIdentifier:@"songbaizhangWrokCatTableViewCell"];
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
    [self.mainTableView.mj_header beginRefreshing];
    MJRefreshFooter *footer=[MJRefreshFooter footerWithRefreshingBlock:^{
        
    }];
    self.mainTableView.mj_footer=footer;
}

- (void)loadNewData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.mainTableView.mj_header endRefreshing];
        self.mainTableView.mj_footer.state=MJRefreshStateNoMoreData;

    });
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (![songbaizhangDataManager shareInstance].login) {
        songbaizhangLoginViewController *login=[songbaizhangLoginViewController new];
          [self.navigationController presentViewController:login animated:YES completion:nil];
        return;
    }
    
    songbaizhangworkDetailViewController *detail=[songbaizhangworkDetailViewController new];
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    songbaizhangWrokCatTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"songbaizhangWrokCatTableViewCell"];
    cell.selectionStyle=0;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
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

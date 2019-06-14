#import "COCHomeViewController.h"
#import "COCHomeHeaderView.h"

@interface COCHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *zTableView;
@property(nonatomic,strong) COCHomeHeaderView *zHeadView;
@end

@implementation COCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTableView];
}

- (void)configTableView{
    self.zTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, COCNavBar_height, SCREEN_Width, SCREEN_Height-(COCNavBar_height)) style:UITableViewStyleGrouped];
    self.zTableView.delegate = self;
    self.zTableView.dataSource = self;
    self.zTableView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.zTableView];
    self.zHeadView = [[COCHomeHeaderView alloc] instanceView];
    self.zHeadView.frame = CGRectMake(0, 0, SCREEN_Width, 540);
    self.zTableView.tableHeaderView = self.zHeadView;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]init];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, 100)];
//    footerView.backgroundColor = [UIColor whiteColor];
    UILabel *desLab = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, SCREEN_Width-16, 100)];
    desLab.text = @"投资前请仔细阅读风险披露以及服务条款。市场有风险，投资需谨慎，请根据自身实际情况制定投资计划。";
    desLab.textColor = [UIColor lightGrayColor];
    desLab.font = [UIFont systemFontOfSize:14];
    desLab.numberOfLines = 0;
    desLab.textAlignment = NSTextAlignmentCenter;
    [footerView addSubview:desLab];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 100;
}


@end

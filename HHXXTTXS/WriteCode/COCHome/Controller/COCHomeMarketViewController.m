#import "COCHomeMarketViewController.h"
#import "COCHomeMarketTableViewCell.h"
#import "COCHomeModel.h"
#import "COCMarketHeaderView.h"
@interface COCHomeMarketViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *zTableView;
@property (nonatomic,strong) NSArray *dataArr;
@property(nonatomic,strong) COCMarketHeaderView *zHeadView;
@end

@implementation COCHomeMarketViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestData];
}

-(void)requestData{
    [COCHomeModel requestdataSuccessBlock:^(NSArray * _Nullable data) {
        self.dataArr = data;
        [self.zTableView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTableView];
}


- (void)configTableView{
    self.zTableView = [[UITableView alloc]init];
    self.zTableView.delegate = self;
    self.zTableView.dataSource = self;
    self.zTableView.rowHeight = 70;
    
    self.zHeadView = [[COCMarketHeaderView alloc] instanceView];
    self.zHeadView.frame = CGRectMake(0, 0, SCREEN_Width, 100);
    self.zTableView.tableHeaderView = self.zHeadView;
    
    [self.zTableView registerNib:[UINib nibWithNibName:@"COCHomeMarketTableViewCell" bundle:nil] forCellReuseIdentifier:@"COCHomeMarketTableViewCell"];
    [self.view addSubview:self.zTableView];
    [self.zTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    COCHomeMarketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"COCHomeMarketTableViewCell"];
    if (!cell) {
        cell = [[COCHomeMarketTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"COCHomeMarketTableViewCell"];
    }
    [cell reloadData:self.dataArr[indexPath.row]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    headerView.backgroundColor = [UIColor whiteColor];
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(16, 0, 100, 50)];
    name.text = @"品种";
    name.textColor = [UIColor grayColor];
    name.font = [UIFont systemFontOfSize:15];
    [headerView addSubview:name];
    
    UILabel *price = [[UILabel alloc]init];
    price.text = @"最新价";
    price.textColor = [UIColor grayColor];
    price.font = [UIFont systemFontOfSize:15];
    [headerView addSubview:price];
    [price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(headerView.mas_centerX);
        make.centerY.mas_equalTo(headerView.mas_centerY);
    }];
    
    UILabel *chg = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-116, 0, 100, 50)];
    chg.text = @"涨跌幅";
    chg.textAlignment = NSTextAlignmentRight;
    chg.textColor = [UIColor grayColor];
    chg.font = [UIFont systemFontOfSize:15];
    [headerView addSubview:chg];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = RGB(242, 242, 242);
    [headerView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(name.mas_bottom);
        make.height.mas_offset(1);
    }];

    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc]init];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArr.count!=0) {
        NSLog(@"%@",[self.dataArr[indexPath.row] objectForKey:@"symbol"]);
    }
}

@end

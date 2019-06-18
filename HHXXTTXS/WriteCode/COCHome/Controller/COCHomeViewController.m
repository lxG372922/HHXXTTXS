#import "COCHomeViewController.h"
#import "COCHomeHeaderView.h"
#import "COCHomePracticeViewController.h"
#import "YUFoldingTableView.h"
#import "COCHomeModel.h"
#import "YUCustomHeaderView.h"
#import "ContentTableViewCell.h"
#import "COCOpenViewController.h"
#import "COCHomeAboutUsViewController.h"

@interface COCHomeViewController ()<YUFoldingTableViewDelegate>
@property (nonatomic,strong)YUFoldingTableView *zTableView;
@property (nonatomic,strong)NSArray *announcementArr;
@property(nonatomic,strong) COCHomeHeaderView *zHeadView;
@property (nonatomic, assign) YUFoldingSectionHeaderArrowPosition arrowPosition;
@end

@implementation COCHomeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configTableView];
    
}

- (UIView *)yuFoldingTableView:(YUFoldingTableView *)yuTableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *headerIdentifier = @"headerIdentifier";
    YUCustomHeaderView *headerFooterView = [yuTableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
    if (headerFooterView == nil) {
        headerFooterView = [[YUCustomHeaderView alloc] initWithReuseIdentifier:headerIdentifier];
    }
    
    headerFooterView.contentView.backgroundColor = [UIColor whiteColor];
    headerFooterView.title = [NSString stringWithFormat:@"%@",[self.announcementArr[section] objectForKey:@"title"]];
    headerFooterView.descriptionText = [NSString stringWithFormat:@"%@",[self.announcementArr[section] objectForKey:@"created"]];
    return headerFooterView;
}

- (void)yuFoldingTableView:(YUFoldingTableView *)yuTableView didSelectHeaderViewAtSection:(NSInteger)section
{
//    NSLog(@"点击了headerView - %ld", section);
}

- (void)getData{
    WS(weakSelf);
    [COCHomeModel requestAnnouncementDataSuccessBlock:^(NSArray * _Nullable data) {
        weakSelf.announcementArr  = [NSArray arrayWithArray:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.zTableView reloadData];
        });
        
    }];
    
}

- (void)configTableView{
    self.zTableView = [[YUFoldingTableView alloc]initWithFrame:CGRectMake(0, COCNavBar_height, SCREEN_Width, SCREEN_Height-(COCNavBar_height))];
    self.zTableView.foldingDelegate = self;
    if (self.arrowPosition) {
        self.zTableView.foldingState = YUFoldingSectionStateShow;
    }
    [self.zTableView registerClass:[ContentTableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
    self.zHeadView = [[COCHomeHeaderView alloc] instanceView];
    weakSelf(self);
    self.zHeadView.frame = CGRectMake(0, 0, SCREEN_Width, 580);
    self.zHeadView.practiceBlock = ^{
        COCHomePracticeViewController *practice = [[COCHomePracticeViewController alloc]init];
        practice.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:practice animated:YES];
    };
    self.zHeadView.openBlock = ^{
        COCOpenViewController *open = [[COCOpenViewController alloc]init];
        open.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:open animated:YES];
    };
    self.zHeadView.aboutUsBlock = ^{
        COCHomeAboutUsViewController *about = [[COCHomeAboutUsViewController alloc]init];
        about.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:about animated:YES];
    };
    self.zTableView.tableHeaderView = self.zHeadView;
    self.zTableView.tableFooterView = [self configFooterView];
    [self.view addSubview:self.zTableView];
}

#pragma mark - YUFoldingTableViewDelegate / required（必须实现的代理）
- (NSInteger )numberOfSectionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    return 5;
}
- (NSInteger )yuFoldingTableView:(YUFoldingTableView *)yuTableView numberOfRowsInSection:(NSInteger )section
{
    return 1;
}
- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForHeaderInSection:(NSInteger )section
{
    return 60;
}

- (UITableViewCell *)yuFoldingTableView:(YUFoldingTableView *)yuTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    ContentTableViewCell *cell = [yuTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ContentTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.contentL.text = [NSString stringWithFormat:@"%@",[self.announcementArr[indexPath.row] objectForKey:@"metadesc"]];
    cell.contentL.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize = CGSizeMake(SCREEN_Width*0.9, 9999);//labelsize的最大值
    //关键语句
    CGSize expectSize = [cell.contentL sizeThatFits:maximumLabelSize];
    //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
    cell.contentL.frame = CGRectMake(SCREEN_Width*0.05, 0, SCREEN_Width*0.9, expectSize.height+20);
    yuTableView.rowHeight = expectSize.height+20;
    
    
    return cell;
}
#pragma mark - YUFoldingTableViewDelegate / optional （可选择实现的）

- (void )yuFoldingTableView:(YUFoldingTableView *)yuTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [yuTableView deselectRowAtIndexPath:indexPath animated:YES];
}

// 返回箭头的位置
- (YUFoldingSectionHeaderArrowPosition)perferedArrowPositionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    // 没有赋值，默认箭头在左
    return self.arrowPosition ? :YUFoldingSectionHeaderArrowPositionLeft;
}

- (UIView *)configFooterView{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, 100)];
    UILabel *desLab = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, SCREEN_Width-16, 100)];
    desLab.text = @"投资前请仔细阅读风险披露以及服务条款。市场有风险，投资需谨慎，请根据自身实际情况制定投资计划。";
    desLab.numberOfLines = 0;
    desLab.textColor = RGB(151, 151, 151);
    desLab.font = FONT(13);
    desLab.textAlignment = NSTextAlignmentCenter;
    [footerView addSubview:desLab];
    return footerView;

}


@end

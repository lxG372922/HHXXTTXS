#import "COCHomeAboutUsViewController.h"
#import "COCAboutView.h"
@interface COCHomeAboutUsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *listView;

/** aboutView */
@property (strong, nonatomic) COCAboutView *aboutView;

@end

@implementation COCHomeAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于我们";
//    [self configTableView];
//    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
//    NSString *icon = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
//    NSString *app_Name = [infoPlist objectForKey:@"CFBundleDisplayName"];
//    self.appnameLab.text = app_Name;
//    self.logoImg.image = LXGetImage(icon);
    // Do any additional setup after loading the view from its nib.
    self.listView.tableHeaderView = self.aboutView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    CGFloat aboutHeight = [self.aboutView getHeight];
    self.aboutView.frame = CGRectMake(0, 0, SCREEN_WIDTH, aboutHeight);
    self.listView.tableHeaderView = self.aboutView;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]init];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc]init];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (COCAboutView *)aboutView {
    if (!_aboutView) {
        _aboutView = [[COCAboutView alloc] init];
    }
    return _aboutView;
}

@end

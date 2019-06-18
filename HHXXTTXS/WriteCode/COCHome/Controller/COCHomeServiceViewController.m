#import "COCHomeServiceViewController.h"
@interface COCHomeServiceViewController ()
@property (nonatomic, strong)UIWebView *webView;

@end

@implementation COCHomeServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"服务条款";
    self.webView = [[UIWebView alloc] init];
    self.webView.backgroundColor = [UIColor whiteColor];
    NSString *url = [[NSBundle mainBundle] pathForResource:@"server_protocol" ofType:@"html"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(self.view);
    }];
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

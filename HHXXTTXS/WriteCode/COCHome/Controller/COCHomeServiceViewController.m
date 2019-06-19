#import "COCHomeServiceViewController.h"
@interface COCHomeServiceViewController ()<UIWebViewDelegate>
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
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(self.view);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [SVProgressHUD show];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD dismiss];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [SVProgressHUD dismiss];
    
}

@end

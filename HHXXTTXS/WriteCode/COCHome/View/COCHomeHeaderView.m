#import "COCHomeHeaderView.h"
#import <SDCycleScrollView.h>
@interface COCHomeHeaderView ()
@property (weak, nonatomic) IBOutlet SDCycleScrollView *zBannerView;

@property (weak, nonatomic) IBOutlet UIView *zViewOne;
@property (weak, nonatomic) IBOutlet UIView *zViewTwo;
@property (weak, nonatomic) IBOutlet UIView *zViewThree;
@property (weak, nonatomic) IBOutlet UIView *zViewFour;
@end

@implementation COCHomeHeaderView

-(instancetype)instanceView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"COCHomeHeaderView" owner:self options:nil] firstObject];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self configUI];
}

- (void)configUI{
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    self.zBannerView.imageURLStringsGroup = imagesURLStrings;
    self.zBannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    self.zBannerView.imageURLStringsGroup = imagesURLStrings;
    self.zBannerView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    self.zBannerView.placeholderImage = [UIImage imageNamed:@"fanchuan"];
    [self addTapGesture];
}

- (void)addTapGesture{
    self.zViewOne.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapzViewOne = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickzViewOne)];
    [self.zViewOne addGestureRecognizer:tapzViewOne];
    self.zViewTwo.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapzViewTwo = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickzViewTwo)];
    [self.zViewTwo addGestureRecognizer:tapzViewTwo];
    self.zViewThree.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapzViewThree = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickzViewThree)];
    [self.zViewThree addGestureRecognizer:tapzViewThree];
    self.zViewFour.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapzViewFoure = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickzViewFour)];
    [self.zViewFour addGestureRecognizer:tapzViewFoure];
}

- (void)clickzViewOne{
    self.practiceBlock();
}

- (void)clickzViewTwo{
    [self replySuccess];
}

- (void)clickzViewThree{
    self.openBlock();
}

- (void)clickzViewFour{
    self.aboutUsBlock();
}

// 拨打客服电话
- (void)replySuccess{
    [self callPhone:@"400-085-0221"];
}

- (void)callPhone:(NSString *)phoneNumber{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phoneNumber];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self addSubview:callWebview];
}

@end

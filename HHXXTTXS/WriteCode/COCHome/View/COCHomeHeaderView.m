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
                                  @"banner_1",
                                  @"banner_2",
                                  ];
    self.zBannerView.imageURLStringsGroup = imagesURLStrings;
    self.zBannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    self.zBannerView.localizationImageNamesGroup = imagesURLStrings;
    self.zBannerView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    self.zBannerView.placeholderImage = [UIImage imageNamed:@"fanchuan"];
    self.zBannerView.clickItemOperationBlock = ^(NSInteger currentIndex) {
        if (currentIndex == 0) {
            self.MarketBlock();
        }
    };
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

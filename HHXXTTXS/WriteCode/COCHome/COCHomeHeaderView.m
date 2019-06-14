#import "COCHomeHeaderView.h"
#import <SDCycleScrollView.h>
@interface COCHomeHeaderView ()<SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet SDCycleScrollView *zBannerView;

@end

@implementation COCHomeHeaderView

-(instancetype)instanceView{
    [self configUI];
    return [[[NSBundle mainBundle]loadNibNamed:@"COCHomeHeaderView" owner:self options:nil] firstObject];
}

- (void)configUI{
//    self.backgroundColor = [UIColor redColor];
    
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    // 图片配文字
    NSArray *titles = @[@"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com",
                        @"感谢您的支持"
                        ];
    
    
    self.zBannerView.imageURLStringsGroup = imagesURLStrings;
    self.zBannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.zBannerView.delegate = self;
    self.zBannerView.titlesGroup = titles;
    self.zBannerView.imageURLStringsGroup = imagesURLStrings;
    self.zBannerView.currentPageDotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
    self.zBannerView.placeholderImage = [UIImage imageNamed:@"fanchuan"];
    
    
    
}



@end

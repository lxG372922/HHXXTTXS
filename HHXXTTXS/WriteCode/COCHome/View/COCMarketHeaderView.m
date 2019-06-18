#import "COCMarketHeaderView.h"

@interface COCMarketHeaderView()

@property (weak, nonatomic) IBOutlet UILabel *available; //可用资金
@property (weak, nonatomic) IBOutlet UILabel *freeze; // 冻结资金

@end

@implementation COCMarketHeaderView

-(instancetype)instanceView{
    return [[[NSBundle mainBundle]loadNibNamed:@"COCMarketHeaderView" owner:self options:nil] firstObject];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self configUI];
}

- (void)configUI{
    self.available.text = @"1111111";
}

@end

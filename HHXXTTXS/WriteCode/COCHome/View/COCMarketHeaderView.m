#import "COCMarketHeaderView.h"

@interface COCMarketHeaderView()


@end

@implementation COCMarketHeaderView

-(instancetype)instanceView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"COCMarketHeaderView" owner:self options:nil] firstObject];
}

@end

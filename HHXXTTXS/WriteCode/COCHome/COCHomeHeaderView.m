#import "COCHomeHeaderView.h"

@implementation COCHomeHeaderView

-(instancetype)instanceView{
    return [[[NSBundle mainBundle]loadNibNamed:@"COCHomeHeaderView" owner:self options:nil] firstObject];
}


@end

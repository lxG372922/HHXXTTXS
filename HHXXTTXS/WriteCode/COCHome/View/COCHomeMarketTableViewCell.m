#import "COCHomeMarketTableViewCell.h"

@interface COCHomeMarketTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *codeLab;

@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UILabel *chgLab;

@end


@implementation COCHomeMarketTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)reloadData:(NSDictionary *)dic{
    self.nameLab.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"contractName"]];
    self.codeLab.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"symbol"]];
    self.priceLab.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"nowV"]];
    self.chgLab.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"upDownRate"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

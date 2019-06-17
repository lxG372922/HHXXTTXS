//
//  COCPosTableViewCell.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/16.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PositionModel;

typedef void(^SetZYZSBlock)(void);//设置止盈止损
typedef void(^MArketSBlock)(void);//设置行情
typedef void(^PINGCangBlock)(NSNumber * _Nonnull index);//设置止盈止损


NS_ASSUME_NONNULL_BEGIN
@interface COCPosTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel *pro_Name;//产品名
@property (nonatomic,weak) IBOutlet UILabel *pro_shou;//多少手
@property (nonatomic,weak) IBOutlet UILabel *pro_duoOrKong;//买多或卖空
@property (nonatomic,weak) IBOutlet UILabel *pro_Price;//+ 盈利亏损
@property (nonatomic,weak) IBOutlet UILabel *pro_KCPrice;//开仓价
@property (nonatomic,weak) IBOutlet UILabel *pro_nowPrice;//现价
@property (nonatomic,weak) IBOutlet UILabel *pro_zhiyPrice;//止盈价
@property (nonatomic,weak) IBOutlet UILabel *pro_zhisPrice;//止损价

@property (nonatomic,weak) IBOutlet UIButton *setYSButton;//设置止盈止损
@property (nonatomic,weak) IBOutlet UIButton *marketDetailBtn;//行情
@property (nonatomic,weak) IBOutlet UIButton *pingCButton;//平仓

@property (nonatomic,copy)SetZYZSBlock setZYZSblock;
@property (nonatomic,copy)MArketSBlock Marketblock;
@property (nonatomic,copy)PINGCangBlock pingCblock;

-(void)setPositionTableViewCellControlContentWithModel:(PositionModel *)dataModel;


@end

NS_ASSUME_NONNULL_END

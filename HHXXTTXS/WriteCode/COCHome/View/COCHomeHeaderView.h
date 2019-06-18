#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^clickNextBlock)(void);

@interface COCHomeHeaderView : UIView

@property (nonatomic,copy)clickNextBlock practiceBlock;
@property (nonatomic,copy)clickNextBlock openBlock;
@property (nonatomic,copy)clickNextBlock aboutUsBlock;
@property (nonatomic,copy)clickNextBlock MarketBlock;

-(instancetype)instanceView;

@end

NS_ASSUME_NONNULL_END

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^clickNextBlock)(void);

@interface COCHomeHeaderView : UIView

@property (nonatomic,copy)clickNextBlock practiceBlock;

-(instancetype)instanceView;

@end

NS_ASSUME_NONNULL_END

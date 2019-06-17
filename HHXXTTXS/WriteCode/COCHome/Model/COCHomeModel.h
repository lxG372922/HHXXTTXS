#import <Foundation/Foundation.h>

typedef void(^successBlock)(NSArray * _Nullable data);

NS_ASSUME_NONNULL_BEGIN

@interface COCHomeModel : NSObject
+(void)requestdataSuccessBlock:(successBlock)successBlock;
@end

NS_ASSUME_NONNULL_END

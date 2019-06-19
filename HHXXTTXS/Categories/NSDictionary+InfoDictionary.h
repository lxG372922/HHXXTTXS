//
//  NSDictionary+InfoDictionary.h


#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSDictionary (InfoDictionary)

/**
 获得Info.plist数据字典,防止infoPlist 文件更换路径导致获取不到的问题
 */
+ (NSDictionary *)gl_getInfoDictionary;
/* 获得当前App的版本号 */
+ (NSString *)gl_getCurrentVersion;
/* 获得当前App的编译版本 */
+ (NSString *)gl_getCurrentBuildVersion;
/* 获得当前App的名称 */
+ (NSString *_Nullable)gl_getCurrentAppName;
/* 获得当前App的图标名称 */
+ (NSString *_Nullable)gl_getIconName;
@end
NS_ASSUME_NONNULL_END

//
//  NSDictionary+InfoDictionary.m

#import "NSDictionary+InfoDictionary.h"

@implementation NSDictionary (InfoDictionary)

/**
 获得Info.plist数据字典,防止infoPlist 文件更换路径导致获取不到的问题
 */
+ (NSDictionary *)gl_getInfoDictionary {
    
    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
    
    if (!infoDict || !infoDict.count) {
        infoDict = [NSBundle mainBundle].localizedInfoDictionary;
    }
    
    if (!infoDict || !infoDict.count) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
        infoDict = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    
    return infoDict ? infoDict : @{};
}

/* 获得当前App的版本号 */
+ (NSString *)gl_getCurrentVersion {
    NSString *version = @"";
    NSDictionary *infoDictionary = [NSDictionary gl_getInfoDictionary];
    if (infoDictionary) {
        version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    }
    return version;
}

/* 获得当前App的编译版本 */
+ (NSString *)gl_getCurrentBuildVersion {
    NSString *buildVersion = @"";
    NSDictionary *infoDictionary = [NSDictionary gl_getInfoDictionary];
    if (infoDictionary) {
        buildVersion = [infoDictionary objectForKey:@"CFBundleVersion"];
    }
    return buildVersion;
}

/* 获得当前App的名称 */
+ (NSString *_Nullable)gl_getCurrentAppName {
    
    NSString *name = @"";
    NSDictionary *infoDictionary = [NSDictionary gl_getInfoDictionary];
    if (infoDictionary) {
        name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    }
    return name;
}

/* 获得当前App的图标名称 */
+ (NSString *_Nullable)gl_getIconName {
    
    NSString *iconName = nil;
    
    NSDictionary *infoDictionary = [NSDictionary gl_getInfoDictionary];
    if (infoDictionary) {
        iconName = [[infoDictionary valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    }
    
    return iconName;
}

@end

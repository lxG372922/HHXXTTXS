
//
//  COCConstants.h
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#ifndef COCConstants_h
#define COCConstants_h

/// ------- API 相关 ---------
#define APIBaseURL_juhe                             [COCServerManager manager].optimalServer.baseApiUrl_juhe
#define APIKey_juhe                                 [COCServerManager manager].optimalServer.appkey_juhe
#define APIBaseURL_51                               [COCServerManager manager].optimalServer.baseApiUrl_51
#define APIKey_51                                   [COCServerManager manager].optimalServer.appkey_51
#define APIBaseURL_jisu                             [COCServerManager manager].optimalServer.baseApiUrl_jisu
#define APIKey_jisu                                 [COCServerManager manager].optimalServer.appkey_jisu

/// ----- 测试账号 ----
#define TestAccount                                 @"13212341234"
#define TestPsd                                     @"123456"

// ------ 字体样式 ----------
#define fFont @"EuphemiaUCAS"
//字体大小IPH
#define UiFontIPH(num) [UIFont systemFontOfSize:IPHONEWIDTH(num)]
//字体大小sys
#define UiFontSys(num) [UIFont systemFontOfSize:num]

// ------ 公共字符串 -----
#define NetErrorTipString @"网络繁忙，请稍后重试"
#define NoDataAndTouchRefresh @"当前无数据，请点击重试"

// ----------- 公共尺寸 ------
/* 屏幕宽 */
#define SCREEN_Width   ([UIScreen mainScreen].bounds.size.width)
/* 屏幕高 */
#define SCREEN_Height  ([UIScreen mainScreen].bounds.size.height)
/* 最大的长度 */
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
/* 最小的长度 */
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

// --------- 适配公共宏 ------
/** 控件缩放比例，按照宽度计算 */
#define SCALE_Length(l) (IS_PORTRAIT ? round((SCREEN_Width/375.0*(l))) : round((SCREEN_Width/667.0*(l))))

/** 是否是异形屏 */
#define IS_HETERO_SCREEN (COC_iPhone_X || COC_iPhone_X_Max)

/** 是否是竖屏 */
#define IS_PORTRAIT (([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown))

// -- 导航栏和Tabbar针对iPhone X 的适配  --
#define Nav_topH (IS_HETERO_SCREEN ? 88.0 : 64.0)
#define Tab_H (IS_HETERO_SCREEN ? 83.0 : 49.0)
#define NavMustAdd (IS_HETERO_SCREEN ? 34.0 : 0.0)
#define TabMustAdd (IS_HETERO_SCREEN ? 20.0 : 0.0)
#define Status_H  (IS_HETERO_SCREEN ? 44.0 : 20.0)
#define NavigationItem_H   (44.0)
#define COCStatue_Height (float)([[UIApplication sharedApplication] statusBarFrame].size.height)
#define COCNavBar_height (float)(COCStatue_Height +44.0f)

//比例适配 返回整数 应对 label有小数时会有边框
#define IPHONEHIGHT(b) (int)([UIScreen mainScreen].bounds.size.height*((b)/1294.0))
#define IPHONEWIDTH(a) (int)([UIScreen mainScreen].bounds.size.width*((a)/750.0))

// 防空判断 ------------
/** 字符串防空判断 */
#define isStrEmpty(string) (string == nil || string == NULL || (![string isKindOfClass:[NSString class]]) || ([string isEqual:@""]) || [string isEqualToString:@""] || [string isEqualToString:@" "] || ([string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0))
/* 返回一个非空的字符串 */
#define STRINGNOTNIL(string) isStrEmpty(string) ? @"" : string

/** 数组防空判断  */
#define isArrEmpty(array) (array == nil || array == NULL || (![array isKindOfClass:[NSArray class]]) || array.count == 0)
/** 字典防空判断 */
#define isDictEmpty(dict) (dict == nil || dict == NULL || (![dict isKindOfClass:[NSDictionary class]]) || dict.count == 0)

// ---- 颜色创建宏 -----
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define HexColor(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]

#define HexAlphaColor(hexValue, alpha) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:alpha]

#define ClearColor [UIColor clearColor]
// 随机色
#define RandomColor RGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


// 项目中主要颜色的定义
#define COCColorTheme                           RGB(29, 36, 51)     // 主题颜色
#define COCColorLong                            RGB(223, 114, 78)      // 上涨颜色(红色)
#define COCColorShort                           RGB(93, 165, 111)     // 下跌颜色(绿色)
#define COCColorLongBG                          HexColor(0xFDE7EE)     // 上涨背景颜色(红色背景)
#define COCColorShortBG                         HexColor(0xEDF7EB)     // 下跌背景颜色(绿色背景)
#define COCColorTitle                           HexColor(0x333333)     // 用于主要文字提示，标题，重要文字
#define COCColorNormalText                      HexColor(0x666666)     // 正常字体颜色，二级文字，标签栏
#define COCColorTipText                         HexColor(0xB4B4B4)     // 提示文字，提示性文字，重要级别较低的文字信息
#define COCColorBorder                          HexColor(0xcccccc)     // 边框颜色，提示性信息
#define COCColorSeparator                       HexColor(0xeeeeee)     // 分割线颜色，宽度1像素
#define COCColorGap                             HexColor(0xF8F8F8)     // 背景间隔色彩
#define COCColorBackGround                      HexColor(0xffffff)     // 白色背景色
#define COCColorText_000000                     HexColor(0x000000)     // 黑色背景色
#define COCColorAlert_f8f8f8                    HexColor(0xf8f8f8)     // 首页收藏视图弹框颜色
#define COCColorWarning                         HexColor(0xFA0000)     // 警告颜色
#define COCColorMarketDetail                    HexColor(0xffffff)      // 行情详情页背景

#define BTNCOlor RGBColor(20, 44, 51)
//背景透明色
#define COCColorAlert_BGColor                   HexAlphaColor(0x000000,0.4)
#define Colorblack [UIColor colorWithHexString:@"#333333"]
#define ColorWhite  [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0]
#define ColorGrayYinHui [UIColor colorsWithRed:221 green:221 blue:221]
#define ColorGrayQian [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1/1.0]
#define ColorClear [UIColor clearColor]
#define ColorCellLine [UIColor colorWithHexString:@"#d8d8d8" ]

// View 圆角
#define XViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

// View 边框
#define XViewBord(View, Color, Width)\
\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:(Color).CGColor]




// 手机尺寸型号
#define COC_iPhone_4x        (SCREEN_Width == 320 && SCREEN_Height == 480)
#define COC_iPhone_5x        (SCREEN_Width == 320 && SCREEN_Height == 568)
#define COC_iPhone_6x        (SCREEN_Width == 375 && SCREEN_Height == 667)
#define COC_iPhone_plus      (SCREEN_Width == 414 && SCREEN_Height == 736)
#define COC_iPhone_X         (SCREEN_Width == 375 && SCREEN_Height == 812)   // iPhone X,    iPhone XS
#define COC_iPhone_X_Max     (SCREEN_Width == 414 && SCREEN_Height == 896)   // iPhone XR,   iPhone XS Max

// weak/strong self ----------
#define weakSelf(ref)           __weak __typeof(ref)weakSelf = ref;
#define strongSelf(weakRef)     __strong __typeof(weakRef)strongSelf = weakRef;

// 通知用到的key -----
#define COC_NotificationKey_NeedLogIn       @"COC_NotificationKey_NeedLogIn"
#define COC_NotificationKey_DidLogIn        @"COC_NotificationKey_DidLogIn"
#define COC_NotificationKey_NeedLogOut      @"COC_NotificationKey_NeedLogOut"
#define COC_NotificationKey_DidLogOut       @"COC_NotificationKey_DidLogOut"

// 公共代码 --- 用作代码混淆 --
#define BBCMIXFUNC -(void)p_mixFunc {   \
NSString *string = [NSString stringWithFormat:@"%s--%s",__FILE__,__func__];\
if (string) {\
string = [string stringByAppendingString:@"asjglarghjkasdi12335ljfgl"];\
}\
}\
\


// View 圆角
#define XViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

// View 边框
#define XViewBord(View, Color, Width)\
\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:(Color).CGColor]

//阴影
#define XViewShadow(View,Color,Opacity,Radius)\
\
View.layer.shadowColor = Color.CGColor;\
View.layer.shadowOffset = CGSizeMake(0,0);\
View.layer.shadowOpacity = Opacity;\
View.layer.shadowRadius = Radius




#endif /* COCConstants_h */

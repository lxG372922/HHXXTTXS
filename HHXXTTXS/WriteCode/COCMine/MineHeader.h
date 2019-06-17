//
//  MineHeader.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#ifndef MineHeader_h
#define MineHeader_h

//获取应用程序窗口的宏
#define G_Window [UIApplication sharedApplication].delegate.window

//屏幕的bounds
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
//屏幕的宽
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//屏幕的高
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//适配宏，以4.7寸屏为准
#define FIT(x) (SCREEN_WIDTH / 375.0 * (x))
//文字大小
#define FONT(X) [UIFont systemFontOfSize:(X)];

//适配iPhoneX
#define IS_iPhoneX (SCREEN_WIDTH == 375.0 && SCREEN_HEIGHT == 812.0)
#define IS_iPhoneXR (SCREEN_WIDTH == 414.0 && SCREEN_HEIGHT == 896.0)   //判断是否是iPhoneX
#define StatusBarheight (IS_iPhoneX || IS_iPhoneXR ? 44 : 20)                  //状态栏高度
#define BottomSafeArea  (IS_iPhoneX || IS_iPhoneXR ? 34 : 0)                   //iPhoneX底部安全距离
#define NAV_BAR_HEIGHT      44.0                                //系统导航条高度
#define TOP_BAR_HEIGHT (StatusBarheight + NAV_BAR_HEIGHT)       //状态栏高度加自定义导航条高度
#define TAB_BAR_HRIGHT      49.0                                //系统标签栏高度


#define RGB(r,g,b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]



//用于登录，退出登录的宏
//判断有没有登录的宏，如果是YES表示登录了，如果是NO表示没有登录
#define Has_Login [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"]
//登录成功，持久化手机号
#define LoginAndSaveUid(uid) [[NSUserDefaults standardUserDefaults] setObject:uid forKey:@"uid"];[[NSUserDefaults standardUserDefaults] synchronize];
//获取手机号
#define UserId (Has_Login ? [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"] : @"")

//退出登录，或uid失效，将持久化的uid删除
#define LogOutRemoveUid [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"uid"]





#endif /* MineHeader_h */

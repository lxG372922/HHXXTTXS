//
//  AppDelegate.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "COCMainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
        weakSelf(self);
        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
        self.initWithSTViewControllerBlock = ^{
    
            weakSelf.window.rootViewController = [[COCMainViewController shareInstance] tabBarVC];
            [weakSelf.window makeKeyAndVisible];
        };
    
    
        [self p_setUpServer];
    
        [self p_setUpSVHUD];
    
        return [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    
//#pragma mark - Debug --
//    
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor = [UIColor whiteColor];
//    self.window.rootViewController = [[COCMainViewController shareInstance] tabBarVC];
//    
//    [self.window makeKeyAndVisible];
//    
//    [self p_setUpServer];
//    
//    [self p_setUpSVHUD];
//    
//    return YES;
}

- (void)p_setUpKeyboardManager {
    
    [[IQKeyboardManager sharedManager] setEnable:YES];
}

- (void)p_setUpServer {
    
    [[ASOServerManager manager]switchServerType:DisServer];
}

- (void)p_setUpSVHUD {
    
    [SVProgressHUD setMinimumDismissTimeInterval:2.0f];
}


@end

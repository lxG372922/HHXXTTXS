//
//  COCMainViewController.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCMainViewController.h"

#import "COCHomeViewController.h"
#import "COCQuotesViewController.h"
#import "COCPositionViewController.h"
#import "COCMineViewController.h"
#import "COCSimulationViewController.h"

#import "COCOpenViewController.h"

@interface COCMainViewController ()<UITabBarControllerDelegate>

/** viewControllers */
@property (strong, nonatomic) NSMutableArray *VCArray;

/** selectedItem img titles */
@property (strong, nonatomic) NSMutableArray *selectedImgNames;

/** unselectedItem img titles */
@property (strong, nonatomic) NSMutableArray *unSelectedImgNames;

@end

@implementation COCMainViewController

#pragma mark - 单例相关 -----begin---
/*
 创建静态对象 防止外部访问
 */
static COCMainViewController *_instance;

/**
 重写初始化方法
 */
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}

/**
 初始化单例
 
 @return Socket管理中心单例
 */
+ (instancetype)shareInstance
{
    return [[self alloc]init];
}

/**
 重写copyWithZone
 */
-(id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

/**
 重写mutableCopyWithZone
 */
-(id)mutableCopyWithZone:(NSZone *)zone
{
    return _instance;
}
#pragma mark - 单例相关 ----- end ---


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 公共方法 --

- (UITabBarController *)tabBarVC {
    
    self.delegate = self;
    
    [self p_setUpViewControllers];
    
    [self p_setUpItems];
    
    [self p_setUpNotification];
    
    return self;
}

#pragma mark - 私有方法 --

- (void)p_setUpViewControllers {
    
    [self.VCArray removeAllObjects];
    
    COCHomeViewController *homeVC = [[COCHomeViewController alloc] init];
    homeVC.title = @"首页";
    homeVC.hidesBottomBarWhenPushed = NO;
    COCBaseNaviController *homeNV = [[COCBaseNaviController alloc] initWithRootViewController:homeVC];
    
    COCQuotesViewController *marketVC = [[COCQuotesViewController alloc] init];
    marketVC.title = @"行情";
    marketVC.hidesBottomBarWhenPushed = NO;
    COCBaseNaviController *marketNV = [[COCBaseNaviController alloc] initWithRootViewController:marketVC];
    
    COCPositionViewController *newsVC = [[COCPositionViewController alloc] init];
    newsVC.title = @"持仓";
    newsVC.hidesBottomBarWhenPushed = NO;
    COCBaseNaviController *newsNV = [[COCBaseNaviController alloc] initWithRootViewController:newsVC];
    
    
    COCMineViewController *meVC = [[COCMineViewController alloc] init];
    meVC.title = @"我的";
    meVC.hidesBottomBarWhenPushed = NO;
    COCBaseNaviController *meNV = [[COCBaseNaviController alloc] initWithRootViewController:meVC];
    
//    COCSimulationViewController *simulationVC = [[COCSimulationViewController alloc] init];
//    simulationVC.title = @"模拟";
//    simulationVC.hidesBottomBarWhenPushed = NO;
//    COCBaseNaviController *simulateNV = [[COCBaseNaviController alloc] initWithRootViewController:simulationVC];
    
//    COCOpenViewController *meVC = [[COCOpenViewController alloc] init];
//    meVC.title = @"开户";
//    meVC.hidesBottomBarWhenPushed = NO;
//    COCBaseNaviController *meNV = [[COCBaseNaviController alloc] initWithRootViewController:meVC];
    
    [self.VCArray addObject:homeNV];
    [self.VCArray addObject:marketNV];
    [self.VCArray addObject:newsNV];
    [self.VCArray addObject:meNV];
//    [self.VCArray addObject:simulateNV];
    [self setViewControllers:self.VCArray];
}

- (void)p_setUpItems {
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:HexColor(0x666666),NSFontAttributeName:[UIFont fontWithName:fFont size:10.f] } forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:HexColor(0x000000)} forState:UIControlStateSelected];
    [UITabBarItem appearance].titlePositionAdjustment = UIOffsetMake(0, -2.0f);
    
    weakSelf(self)
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop) {
        if (idx < self.selectedImgNames.count) {
            UIImage *image = [UIImage imageNamed:weakSelf.unSelectedImgNames[idx]];
            UIImage *imageSelected = [UIImage imageNamed:weakSelf.selectedImgNames[idx]];
            item.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            item.selectedImage = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
    }];
}


- (void)p_setUpNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_needLogin) name:COC_NotificationKey_NeedLogIn object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_didLogin) name:COC_NotificationKey_DidLogIn object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_needLogOut) name:COC_NotificationKey_NeedLogOut object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_didLogOut) name:COC_NotificationKey_DidLogOut object:nil];
}

- (void)p_needLogin {
    
}

- (void)p_didLogin {
    
}

- (void)p_needLogOut {
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.tabBarController setSelectedIndex:0];
//        UINavigationController *meNav = [[self.tabBarController viewControllers] objectAtIndex:3];
//        [meNav popToRootViewControllerAnimated:NO];
//    });
}

- (void)p_didLogOut {
    
}

#pragma mark - tabBarViewController delegate ----

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    BOOL canSelected = YES;
    
    
    return canSelected;
}

#pragma mark - 懒加载 --

- (NSMutableArray *)VCArray {
    if (!_VCArray) {
        _VCArray = @[].mutableCopy;
    }
    return _VCArray;
}

- (NSMutableArray *)selectedImgNames {
    if (!_selectedImgNames) {
        _selectedImgNames = @[
                              @"tabbar_home_sel",
                              @"tabbar_market_sel",
                              @"tabbar_news_sel",
                              @"tabbar_me_sel"
                              ].mutableCopy;
    }
    return _selectedImgNames;
}

- (NSMutableArray *)unSelectedImgNames {
    if (!_unSelectedImgNames) {
        _unSelectedImgNames = @[
                                @"tabbar_home_nor",
                                @"tabbar_market_nor",
                                @"tabbar_news_nor",
                                @"tabbar_me_nor"
                                ].mutableCopy;
    }
    return _unSelectedImgNames;
}


@end

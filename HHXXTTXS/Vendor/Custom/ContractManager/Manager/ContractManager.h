//
//  ContractManager.h
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ContractManager,PositionModel,OrderModel;
NS_ASSUME_NONNULL_BEGIN

@protocol ContractManagerDelegate <NSObject>
/**
 持仓列表有变化

 @param manager 管理器
 @param positionList 持仓列表
 */
- (void)contractManager:(ContractManager *)manager positionListDidChange:(NSDictionary <NSString *, PositionModel *>*)positionList;

/**
 资金变化

 @param manager 管理器
 @param availableCapital 可用资金
 @param marketCapital 市值
 */
- (void)contractManager:(ContractManager *)manager availableCapitalDidChange:(NSString *)availableCapital marketCapital:(NSString *)marketCapital;

@end

@interface ContractManager : NSObject

/** 持仓列表 */
@property (strong, nonatomic) NSMutableDictionary <NSString *, PositionModel *>*positions;

/** 委托列表 */
@property (strong, nonatomic) NSMutableArray <OrderModel *>*orderList;

/** 历史记录 */
@property (strong, nonatomic) NSMutableDictionary <NSString *, NSArray <OrderModel *>*>* hisOrderList;

/** 单例初始化 */
+ (instancetype)manager;

/** 重置模拟资金 */
- (void)resetSimulateCapitail;

- (void)addDelegate:(id<ContractManagerDelegate>)delegate;

- (void)removeDelegate:(id<ContractManagerDelegate>)delegate;

/* 当前可用的金额 */
- (NSString *)getCurrentAvailCaptital;

/* 当前的市值 */
- (NSString *)getCurrentMarketCapital;

/**
 当前的资金可开手数

 @param price 价格
 @param lever 杠杆
 @return 可开手数
 */
- (CGFloat)canOpenHandsWithPrice:(NSString *)price lever:(NSString *)lever;

/**
 添加委托订单(⚠️添加订单前一定要监测一下可开手数是否正确)

 @param orderModel 委托订单模型
 */
- (void)addOrderWithModel:(OrderModel *)orderModel;


/**
 更新最新价格

 @param newPrice 最新价
 @param identifier 唯一标识符
 */
- (void)updateNewPrice:(NSString *)newPrice forIdentifier:(NSString *)identifier;
@end

NS_ASSUME_NONNULL_END

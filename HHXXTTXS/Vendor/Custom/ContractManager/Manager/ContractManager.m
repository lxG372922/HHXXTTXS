//
//  ContractManager.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ContractManager.h"
#import "GLPositionModel.h"
#import "OrderModel.h"
#import "NSString+Path.h"
/** 模拟持仓列表 */
#define COC_ArchiverPath_SimulatePostion        [@"COC_ArchiverPath_SimulatePostion" pathInDocumentDirectory]

/** 模拟委托列表 */
#define COC_ArchiverPath_SimulateOrders         [@"COC_ArchiverPath_SimulateOrders" pathInDocumentDirectory]

/** 历史委托列表 */
#define COC_ArchiverPath_HisSimulateOrders      [@"COC_ArchiverPath_HisSimulateOrders" pathInDocumentDirectory]

/** 当前可用资产 */
#define COC_ArchiverPath_CurrentCapital         [@"COC_ArchiverPath_CurrentCapital" pathInDocumentDirectory]

@interface ContractManager ()

/**
 代理集合类
 */
@property (strong, nonatomic) NSPointerArray *delegateContainer;

/** currentAvailableCapital */
@property (strong, nonatomic) NSString *availableCapital;

/** maketCapital */
@property (strong, nonatomic) NSString *marketCapital;

@end

@implementation ContractManager

#pragma mark - 单例相关 -----begin---
/*
 创建静态对象 防止外部访问
 */
static ContractManager *_manager;
/**
 重写初始化方法
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_manager == nil) {
            _manager = [super allocWithZone:zone];
        }
        
        [_manager p_initialize];
    });
    return _manager;
}

/**
 快速创建单例对象的类方法
 
 @return 单利对象
 */
+ (instancetype)manager
{
    return [[self alloc]init];
}

/**
 重写copyWithZone
 */
- (id)copyWithZone:(NSZone *)zone
{
    return _manager;
}

/**
 重写mutableCopyWithZone
 */
- (id)mutableCopyWithZone:(NSZone *)zone
{
    return _manager;
}

#pragma mark - 单例相关 ----- end ---

#pragma mark - 代理相关 ----- begin ---

/**
 添加代理
 
 @param delegate 遵循<ContractManagerDelegate>协议的代理
 支持多代理模式，但是要记得移除，否则会造成多次调用
 */
- (void)addDelegate:(id<ContractManagerDelegate>)delegate {
    if(delegate) {
        for (id tempDelegate in self.delegateContainer) {
            if ([tempDelegate isEqual:delegate]) {
                // 已经有了这个代理直接return
                return;
            }
        }
        // 将代理添加到弱引用容器中
        [self.delegateContainer addPointer:(__bridge void * _Nullable)(delegate)];
    }
    
    // 自动检测并移除失效的代理
    [self.delegateContainer compact];
}

/**
 移除代理
 
 @param delegate 遵循<ContractManagerDelegate>协议的代理
 */
- (void)removeDelegate:(id<ContractManagerDelegate>)delegate {
    
    if (delegate) {
        for (int a = 0 ; a < self.delegateContainer.count ; a ++) {
            
            id tempDelegate = [self.delegateContainer pointerAtIndex:a];
            
            if (tempDelegate && [tempDelegate isEqual:delegate]) {
                [self.delegateContainer removePointerAtIndex:a];
                break;
            }
        }
    }
    
    // 自动检测并移除失效的代理
    [self.delegateContainer compact];
}


/**
 代理弱引用容器的懒加载
 */
- (NSPointerArray *)delegateContainer {
    
    if(!_delegateContainer) {
        _delegateContainer = [NSPointerArray weakObjectsPointerArray];
    }
    return _delegateContainer;
}
#pragma mark - 代理相关 ----- end ---

#pragma mark - 公共方法 --

/* 当前可用的金额 */
- (NSString *)getCurrentAvailCaptital {
    
    if (isStrEmpty(self.availableCapital)) {
        
        NSData *data = [NSData dataWithContentsOfFile:COC_ArchiverPath_SimulatePostion];
        self.availableCapital = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSString class] fromData:data ? : [NSData data] error:nil];
        if (!self.availableCapital) {
            self.availableCapital = [SIMULATECAPITAL stringValue];
        }
    }

    return self.availableCapital ? : @"0";
}

/* 当前的市值 */
- (NSString *)getCurrentMarketCapital {
    
    return self.marketCapital;
}

/**
 当前的资金可开手数
 
 @param price 价格
 @param lever 杠杆
 @return 可开手数
 */
- (CGFloat)canOpenHandsWithPrice:(NSString *)price lever:(NSString *)lever {
    
    CGFloat hands = [self.availableCapital floatValue] * [lever floatValue] / [price floatValue];
    
    if (hands <= 0) {
        hands = 0.0f;
    }
    
    return hands;
}

/**
 添加委托订单
 
 @param orderModel 委托订单模型
 */
- (void)addOrderWithModel:(OrderModel *)orderModel {
    
    if (orderModel) {
    
        
        
        
    }
}

/**
 更新最新价格
 
 @param newPrice 最新价
 @param identifier 唯一标识符
 */
- (void)updateNewPrice:(NSString *)newPrice forIdentifier:(NSString *)identifier {
    
}

#pragma mark - 私有方法 --

- (void)p_initialize {
    weakSelf(self);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        [weakSelf p_updateCapitial];
        
    });
}

- (void)p_updateCapitial {
    
//    [self positions];
    [self p_updatePositionListWithOrderModel:nil];
    [self orderList];
    [self hisOrderList];
}

/**
 更新持仓列表
 */
- (void)p_updatePositionListWithOrderModel:(OrderModel *)orderModel {
    
    CGFloat marketValue = 0.0f;
    BOOL isExist = NO;
    for (NSString *tempKey in [self.positions allKeys]) {
        GLPositionModel *tempModel = [self.positions objectForKey:tempKey];
        CGFloat tempMarketValue = [tempModel.marketValue floatValue];
        
        if (tempMarketValue <= 0) {
            [self.positions removeObjectForKey:tempKey];
            continue;
        }
        
        if ([tempKey isEqualToString:orderModel.identifier] && [tempModel isCanUpdateWithOrderTradeType:orderModel.tradeType]) {
            [tempModel updateWithOrderModel:orderModel];
            isExist = YES;
        }
        
        marketValue += [tempModel.marketValue floatValue];
    }
    
    if (!isExist) {
        
        GLPositionModel *newPosition = [[GLPositionModel alloc] init];
        [newPosition updateWithOrderModel:orderModel];
//        [self.positions add]
    }
}

/**
 根据id找到指定产品的持仓模型

 @param identifier 唯一标识符
 @return 指定的持仓模型
 */
- (GLPositionModel * _Nullable)positionForIdentifier:(NSString *)identifier {
    
    GLPositionModel *tempModel = nil;

    if (!isStrEmpty(identifier) && self.positions.count > 0) {
        tempModel = [self.positions objectForKey:identifier];
    }

    return tempModel;
}

- (NSMutableDictionary<NSString *,GLPositionModel *> *)positions {
    if (!_positions) {
        
        NSData *data = [NSData dataWithContentsOfFile:COC_ArchiverPath_SimulatePostion];
        _positions = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSMutableArray class] fromData:data ? : [NSData data] error:nil];
        
        if (!_positions || !data) {
            _positions = @{}.mutableCopy;
        }
    }
    return _positions;
}

- (NSMutableArray<OrderModel *> *)orderList {
    if (!_orderList) {
        NSData *data = [NSData dataWithContentsOfFile:COC_ArchiverPath_SimulatePostion];
        _orderList = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSMutableArray class] fromData:data ? : [NSData data] error:nil];
        if (!_orderList || !data) {
            _orderList = @[].mutableCopy;
        }
    }
    return _orderList;
}

- (NSMutableDictionary<NSString *,NSArray<OrderModel *> *> *)hisOrderList {
    if (!_hisOrderList) {
        
        NSData *data = [NSData dataWithContentsOfFile:COC_ArchiverPath_HisSimulateOrders];
        _hisOrderList = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSMutableArray class] fromData:data ? : [NSData data] error:nil];
        if(!_hisOrderList || !data) {
            _hisOrderList = @{}.mutableCopy;
        }
    }
    return _hisOrderList;
}



@end

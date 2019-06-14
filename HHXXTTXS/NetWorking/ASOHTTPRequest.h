//
//  ASOBaseView.h
//  ASOFutureProject
//
//  Created by Mac on 2019/5/9.
//  Copyright © 2019 ghostlord. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^SuccessBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject);
typedef void(^FaileBlock)(NSURLSessionDataTask * _Nullable task,NSError * _Nonnull error);

@interface ASOHTTPRequest : NSObject

@property (nonatomic,strong)AFHTTPSessionManager *manager;

+(instancetype)sharedInstance;

-(void)oneGet:(NSString*)baseUrl path:(NSString *)path parameters:(NSDictionary * _Nullable)parameters success:(SuccessBlock)successBlock faile:(FaileBlock)faileBlock;

-(void)onePost:(NSString*)baseUrl path:(NSString *)path parameters:(NSDictionary * _Nullable)parameters success:(SuccessBlock)successBlock faile:(FaileBlock)faileBlock;
@end
NS_ASSUME_NONNULL_END

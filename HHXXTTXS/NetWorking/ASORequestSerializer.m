//
//  ASOBaseView.h
//  ASOFutureProject
//
//  Created by Mac on 2019/5/9.
//  Copyright © 2019 ghostlord. All rights reserved.
//

#import "ASORequestSerializer.h"

@implementation ASORequestSerializer

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    // 设置缓存策略
    self.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    self.timeoutInterval = 10.0f;
    
    return self;
}

@end

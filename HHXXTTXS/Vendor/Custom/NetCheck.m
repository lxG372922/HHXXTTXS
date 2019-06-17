//
//  NoDataView.h
//  FutureApp
//
//  Created by LonelyTown on 2019/6/5.
//  Copyright © 2019 ghostlord. All rights reserved.
//

#import "NetCheck.h"
#import<SystemConfiguration/SCNetworkReachability.h>

@implementation NetCheck

+(BOOL)isNetWorkReachable {
    struct sockaddr_storage zeroAddress;
    
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.ss_len = sizeof(zeroAddress);
    zeroAddress.ss_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        return NO;
    }
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    
    return (isReachable&&!needsConnection) ? YES : NO;
}

@end


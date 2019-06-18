#import "COCHomeModel.h"

@implementation COCHomeModel
+(void)requestdataSuccessBlock:(successBlock)successBlock{
    [SVProgressHUD showWithStatus:nil];
    [[ASOHTTPRequest sharedInstance] oneGet:@"https://hq.inquant.cn/hqfut/MktData/clientcontractDataList.ashx?version=2.9.6&packtype=1000&s=App%252520Store&&datatype=2&deviceid=7DE1FCE6-2C7E-48FD-8A79-520FD4E785E2&mobilemode=iPhone11,2&type=11" path:nil parameters:[NSDictionary dictionary] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *data  = [responseObject objectForKey:@"data"];
        [SVProgressHUD dismiss];
        if (successBlock) {
            successBlock(data);
        }
    } faile:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self requestFaile];
    }];
}

+(void)requestAnnouncementDataSuccessBlock:(successBlock)successBlock{
    [SVProgressHUD showWithStatus:nil];
    [[ASOHTTPRequest sharedInstance] oneGet:@"https://raw.githubusercontent.com/13511029398/HHXXJSON/master/Announ.json" path:nil parameters:[NSDictionary dictionary] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if (successBlock) {
            successBlock(responseObject);
        }
    } faile:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self requestFaile];
    }];
}

+ (void)requestFaile
{
    [SVProgressHUD dismiss];
    [SVProgressHUD showErrorWithStatus:@"请检查网络"];
    [SVProgressHUD dismissWithDelay:2.f];
}

@end

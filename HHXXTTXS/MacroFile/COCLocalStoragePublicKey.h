
//
//  COCLocalStoragePublicKey.h
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#ifndef COCLocalStoragePublicKey_h
#define COCLocalStoragePublicKey_h


// 用户信息存储
#define ASO_ArchiverPath_UserData           [@"ASO_ArchiverPath_UserData" pathInDocumentDirectory]

/* 账号密码表 */
#define ASO_ArchiverPath_Account            [@"ASO_ArchiverPath_Account" pathInDocumentDirectory]

/* 自选列表 */
#define ASO_ArchiverPath_Fav                [@"ASO_ArchiverPath_Fav" pathInDocumentDirectory]

/** 关注列表 */
#define ASO_ArchiverPath_WatchList          [@"ASO_ArchiverPath_WatchList" pathInDocumentDirectory]

/** 模拟炒股持仓列表 */
#define ASO_ArchiverPath_SimulatePostion    [@"ASO_ArchiverPath_SimulatePostion" pathInDocumentDirectory]
///-----------Market URL
//code 列表数据
#define GetGitHubHXlistcode @"https://raw.githubusercontent.com/youshixu/FututerDataInfo/master/FuturesHXlistAllCode"
///获取 当前code的信息
#define GetCodeDetails @"http://hq1.fc.xishisoft.com/query/current?product_code=sc1907%2Cjm1909%2Ceg1909%2Crb1910%2Ci1909%2Cj1909%2CTA909%2Cru1909%2Cau1912%2Cag1912%2Chc1910%2Cfu1909%2Ca1909%2Cc1909"
//@"http://hq1.fc.xishisoft.com/query/current?product_code=sc1907&jm1909&eg1909&rb1910&i1909&j1909&TA909&ru1909&au1912&ag1912"
#define getMarketLineTime  @"http://hq1.fc.xishisoft.com/query/k_line?product_code="
#endif /* COCLocalStoragePublicKey_h */

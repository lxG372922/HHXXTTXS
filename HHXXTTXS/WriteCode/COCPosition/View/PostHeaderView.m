//
//  PostHeaderView.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "PostHeaderView.h"
#import "COCHostModel.h"
@interface PostHeaderView ()<ContractManagerDelegate>



@end

@implementation PostHeaderView

-(instancetype)initWithDataModel:(COCHostModel*)model oiginY:(CGFloat)oiginY{
    
    if (self = [super initWithFrame:CGRectMake(0, oiginY, SCREEN_Width, 100)]) {
        //获取可用资金
        NSString *avaiCaptital =  [[ContractManager manager] getCurrentAvailCaptital];
        NSString *marketCapital =  [[ContractManager manager] getCurrentAvailCaptital];
        
        self.totailLabel =[[UILabel alloc] initWithFrame:CGRectMake(10, 20, SCREEN_Width/2 - 20, 20)];
        self.totailLabel.text = @"浮动总盈亏";
        self.totailLabel.textColor =UIColor.lightGrayColor;
        self.totailLabel.font = UiFontSys(13);
        [self addSubview:self.totailLabel];
        
        self.totaijinE =[[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.totailLabel.frame)+3, SCREEN_Width/2 , 30)];
        if (model.totailCapital == nil || [model.totailCapital isEqualToString:@""]) {
            self.totaijinE.text = @"+0.00";
        }else{
            self.totaijinE.text = model.totailCapital;
        }
        
        self.totaijinE.textColor = RGBColor(249, 115, 84);
        self.totaijinE.font = UiFontSys(26);
        [self addSubview:self.totaijinE];
        
        self.aviableLabel =[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_Width/2, 20, SCREEN_Width/4 +10, 20)];
        self.aviableLabel.text = @"可用资金（¥）";
        self.aviableLabel.textColor =UIColor.blackColor;
        self.aviableLabel.font = UiFontSys(13);
        [self addSubview:self.aviableLabel];
        
        self.aviablejinE =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.aviableLabel.frame), 20, SCREEN_Width/4 +10 ,20)];
//        if (model.avaiCapital == nil || [model.avaiCapital isEqualToString:@""]) {
//            self.aviablejinE.text = @"0.00";
//        }else{
//            self.aviablejinE.text = model.avaiCapital;
//        }
        if(Has_Login){
            self.aviablejinE.text  = avaiCaptital;
        }else{
            self.aviablejinE.text  = @"00.00";
        }
        
        self.aviablejinE.textColor = RGBColor(249, 115, 84);
        self.aviablejinE.font = UiFontSys(14);
        [self addSubview:self.aviablejinE];
        
        self.bondCaLabel =[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_Width/2, CGRectGetMaxY(self.aviableLabel.frame), SCREEN_Width/4 +10, 20)];
        self.bondCaLabel.text = @"持仓保证金（¥）";
        self.bondCaLabel.textColor =UIColor.blackColor;
        self.bondCaLabel.font = UiFontSys(13);
        [self addSubview:self.bondCaLabel];
        
        self.bondjinE =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bondCaLabel.frame), CGRectGetMaxY(self.aviableLabel.frame), SCREEN_Width/4 - 30 ,20)];
        
        if (model.bondCapital == nil || [model.bondCapital isEqualToString:@""]) {
            self.bondjinE.text = @"0.00";
        }else{
            self.bondjinE.text = model.bondCapital;
        }
        
        self.bondjinE.textColor = RGBColor(249, 115, 84);
        self.bondjinE.font = UiFontSys(14);
        [self addSubview:self.bondjinE];

        self.netCapLabel =[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_Width/2, CGRectGetMaxY(self.bondCaLabel.frame), SCREEN_Width/4 +10, 20)];
        self.netCapLabel.text = @"资产净值（¥）";
        self.netCapLabel.textColor =UIColor.blackColor;
        self.netCapLabel.font = UiFontSys(13);
        [self addSubview:self.netCapLabel];
        
        self.netCapjinE =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.netCapLabel.frame), CGRectGetMaxY(self.bondCaLabel.frame), SCREEN_Width/4  ,20)];
        
//        if (model.netCapital == nil || [model.netCapital isEqualToString:@""]) {
//            self.netCapjinE.text = @"0.00";
//        }else{
//            self.netCapjinE.text = avaiCaptital;
//
        if(Has_Login){
            self.netCapjinE.text  = avaiCaptital;
        }else{
            self.netCapjinE.text  = @"0.00";
        }
        
//        }
        
        self.netCapjinE.textColor = RGBColor(249, 115, 84);
        self.netCapjinE.font = UiFontSys(14);
        [self addSubview:self.netCapjinE];
        
        if(Has_Login){
            
            self.bondjinE.text = [[ContractManager manager] getAllOCCMargin];
            self.totaijinE.text = [[ContractManager manager] getAllPL];
            self.netCapjinE.text = [[ContractManager manager] getCurrentAllCapital];
        }else{
            self.bondjinE.text = @"0.00";
            self.totaijinE.text = @"0.00";
            self.netCapjinE.text = @"0.00";
        }
       
        
        
    }
    return self;
}



@end

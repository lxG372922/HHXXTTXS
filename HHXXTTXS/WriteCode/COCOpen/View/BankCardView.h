//
//  BankCardView.h
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XDSDropDownMenu.h"
NS_ASSUME_NONNULL_BEGIN

@interface BankCardView : LXBaseView<XDSDropDownMenuDelegate,UITextFieldDelegate>{
    
    UILabel *titleL;
    
    UIView *cardBack,*nameBack;
    
    NSDictionary *bankNameDic;
    NSArray *contenArr;
    XDSDropDownMenu *nameDropDownMenu;
    
}

@property(nonatomic,strong)UITextField *cardT;

@property(nonatomic,strong)UIButton *bankBack;

@property(nonatomic,copy)NSString *bankClass;

@property(nonatomic,strong)UIButton *lastBtn;

@property(nonatomic,copy)NSString *name;

-(void)getNameTest;

@end

NS_ASSUME_NONNULL_END

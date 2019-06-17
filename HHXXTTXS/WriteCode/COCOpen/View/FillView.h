//
//  FillView.h
//  HHXXTTXS
//
//  Created by apple on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "LXBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FillView : LXBaseView<UITextFieldDelegate>{
    UIView *nameBackV,*numBackV;
}

@property(nonatomic,strong)UITextField *nameT,*numberT;

@property(nonatomic,strong)UIButton *nextBtn;

@end

NS_ASSUME_NONNULL_END

//
//  MyHeaderView.h
//  NewStock
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 class. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyHeaderView : UIView
//背景图
@property (nonatomic , strong)UIImageView *bgImage;

//头像
@property (nonatomic , strong)UIImageView *headerImage;

//名称
@property (nonatomic , strong)UILabel *nameLab;

//signature个性签名
@property (nonatomic , strong)UILabel *signatureLab;

//实名认证
@property (nonatomic , strong)UIButton *certificationBtn;

//积分
@property (nonatomic , strong)UILabel *integralLab;
@property (nonatomic , strong)UILabel *integralNum;





@end

NS_ASSUME_NONNULL_END

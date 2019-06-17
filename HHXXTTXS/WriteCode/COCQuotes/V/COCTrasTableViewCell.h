//
//  COCTrasTableViewCell.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface COCTrasTableViewCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel *titleLabel;//baiti
@property (nonatomic,weak) IBOutlet UILabel *tipLabel;//多少手
@property (nonatomic,weak) IBOutlet UILabel *fanWLabel;//范围
@property (nonatomic,weak) IBOutlet UITextField *infoTextTF;
@property (nonatomic,weak) IBOutlet UIImageView *jtImageView;//产品名
@property (nonatomic,weak) IBOutlet UIView *btnView;

@property (nonatomic,weak) IBOutlet UIButton *btn1;
@property (nonatomic,weak) IBOutlet UIButton *btn2;
@property (nonatomic,weak) IBOutlet UIButton *btn3;
@property (nonatomic,weak) IBOutlet UIButton *btn4;
@property (nonatomic,weak) IBOutlet UIButton *btn5;
@property (nonatomic,weak) IBOutlet UIButton *btn6;

@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,assign) NSInteger index;
-(void) creatBtnWithTitle:(NSArray *)titleArray idnexRow:(NSInteger )index ;

@end

NS_ASSUME_NONNULL_END

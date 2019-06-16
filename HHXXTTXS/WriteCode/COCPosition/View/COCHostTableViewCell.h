//
//  COCHostTableViewCell.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class COCHostModel;
NS_ASSUME_NONNULL_BEGIN

@interface COCHostTableViewCell : UITableViewCell

@property (nonatomic , strong)UILabel *titleLab;
@property (nonatomic , strong)UILabel *timeLab;

-(void)setNewsTableViewCellControlContentWithModel:(COCHostModel *)dataModel;

@end

NS_ASSUME_NONNULL_END

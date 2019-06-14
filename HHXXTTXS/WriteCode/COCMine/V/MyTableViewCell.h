//
//  MyTableViewCell.h
//  NewStock
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 class. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell

@property (nonatomic , strong)UIImageView *imgV;

@property (nonatomic , strong)UILabel *titleLab;

@property (nonatomic , strong)UILabel *detailsLab;

@property (nonatomic , strong)UILabel *line;

-(void)refreashLayoutWithFrame:(int)type;

@end

NS_ASSUME_NONNULL_END

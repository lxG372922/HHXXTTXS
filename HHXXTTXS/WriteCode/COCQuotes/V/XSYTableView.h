//
//  XjhTableView.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol XjhClickTypeDelegate <NSObject>

-(void)ClickTableRowWithModel:(id)model;

@end

@interface XSYTableView : UITableView

@property(nonatomic,weak) id<XjhClickTypeDelegate> xjhDelegate ;

-(instancetype)initWithCustomFrame:(CGRect)frame;

///加载数据
-(void)UpDateTalbeViewWitharray:(NSArray*)array;

@end



//
//  XjhTableView.m
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import "XSYTableView.h"
#import "MarketTableViewCell.h"
@interface XSYTableView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,copy) NSArray * syDaMArray ;
@property(nonatomic,assign)CGFloat heightCell;
@property(nonatomic,strong) MJRefreshNormalHeader * syyheader ;
@property(nonatomic,strong) UIButton * updataBtn ;//更新按钮
@end

@implementation XSYTableView

-(instancetype)initWithCustomFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame style:UITableViewStylePlain]) {
        
        self.syDaMArray = [NSMutableArray array];
        self.heightCell = 0.01;
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
         _syyheader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadUpdateData)];
        self.mj_header = _syyheader;
        [self registerNib:[UINib nibWithNibName:@"MarketTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
        
       
        
        self.updataBtn = [myButton buttonWithType:UIButtonTypeSystem frame:CGRectMake(0, 0, 100, 35) title:@"重新加载" colors:ColorWhite andBackground:COCColorTheme tag:1234 andBlock:^(myButton *button) {
            
            [self reloadUpdateData];
        }];
        CGPoint cen =self.updataBtn.center;
        cen = self.center;
        self.updataBtn.center = cen;
        self.updataBtn.y -= 70;
    }
    
    return self;
}

-(void)reloadUpdateData{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"xjhtableview" object:nil];
}

-(void)UpDateTalbeViewWitharray:(NSArray *)array{
 
    
    _syDaMArray = [NSArray arrayWithArray:array];
    [self.mj_header endRefreshing];
    
     _heightCell = 70;
    [self reloadData];
}
//-(NSInteger)numberOfRowsInSection:(NSInteger)section{
//    
//    return  _syDaMArray.count;
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ( _syDaMArray.count>0) {
        [_updataBtn removeFromSuperview];
        return  _syDaMArray.count;
    }
    [self addSubview:_updataBtn];
    return  0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  
    MarketTableViewCell * cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    
    if (!cell1) {
        cell1 = [[MarketTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        
    }
    cell1.marketmodel = _syDaMArray[indexPath.row];
 
    return cell1;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [self.xjhDelegate ClickTableRowWithModel:_syDaMArray[indexPath.row]];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _heightCell;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 40)];
    header.backgroundColor = [UIColor whiteColor];
//    UILabel * label = [myLabel labelWithframe:CGRectMake(header.width/2-50, 0, 100, 40) backgroundColor:[UIColor whiteColor] title:@"期货" font:14 Alignment:NSTextAlignmentCenter textColor:[UIColor blackColor]];
//    label.font = [UIFont boldSystemFontOfSize:14];
//    [header addSubview:label];
//    UILabel * labelline = [myLabel labelWithframe:CGRectMake(0, label.height-1, SCREEN_Width , 1) backgroundColor:[UIColor grayColor] title:@"" font:14 Alignment:NSTextAlignmentCenter textColor:[UIColor blackColor]];
//    [header addSubview:labelline];
//
    
    NSArray * titleArr = @[@"名称",@"最新价",@"涨跌幅"];
    CGFloat wid = (SCREEN_Width-80)/4;
    
    for (int i=0; i<titleArr.count; i++) {
        
        UILabel * label = [myLabel labelWithframe:CGRectMake(20+(i>0?wid:0)+i*wid, 0, (i==0?wid*2:wid), 40) backgroundColor:[UIColor whiteColor] title:titleArr[i] font:14 Alignment:i==2?NSTextAlignmentRight:NSTextAlignmentLeft textColor:COCColorTheme];
        
        [header addSubview:label];
    }
    return header;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
    
}


@end

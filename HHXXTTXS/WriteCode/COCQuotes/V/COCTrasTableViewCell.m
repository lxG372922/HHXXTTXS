//
//  COCTrasTableViewCell.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCTrasTableViewCell.h"

@implementation COCTrasTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void) creatBtnWithTitle:(NSArray *)titleArray idnexRow:(NSInteger )index {
    self.index = index;
    self.titleArray = [NSArray arrayWithArray:titleArray];
    [self.btn1 setTitle:titleArray[0] forState:UIControlStateNormal];
    [self.btn2 setTitle:titleArray[1] forState:UIControlStateNormal];
    [self.btn3 setTitle:titleArray[2] forState:UIControlStateNormal];
    [self.btn4 setTitle:titleArray[3] forState:UIControlStateNormal];
    [self.btn5 setTitle:titleArray[4] forState:UIControlStateNormal];
    [self.btn6 setTitle:titleArray[5] forState:UIControlStateNormal];
    UIColor *btncolor;
    if (index == 0) {
        btncolor = RGB(30, 32, 34);
    }else if(index == 1){
       btncolor = RGB(48, 165, 130);
    }else{
       btncolor = RGB(242, 120, 101);
    }
    
    [self.btn1 setTitleColor:btncolor forState:UIControlStateNormal];
    [self.btn2 setTitleColor:btncolor forState:UIControlStateNormal];
    [self.btn3 setTitleColor:btncolor forState:UIControlStateNormal];
    [self.btn4 setTitleColor:btncolor forState:UIControlStateNormal];
    [self.btn5 setTitleColor:btncolor forState:UIControlStateNormal];
    [self.btn6 setTitleColor:btncolor forState:UIControlStateNormal];
}


-(IBAction)btn1Click:(id)sender{
    
    self.infoTextTF.text =self.titleArray[0];
}
-(IBAction)btn2Click:(id)sender{
    self.infoTextTF.text =self.titleArray[1];
}
-(IBAction)btn3Click:(id)sender{
    self.infoTextTF.text =self.titleArray[2];
}
-(IBAction)btn4Click:(id)sender{
    self.infoTextTF.text =self.titleArray[3];
}
-(IBAction)btn5Click:(id)sender{
    self.infoTextTF.text =self.titleArray[4];
}
-(IBAction)btn6Click:(id)sender{
    self.infoTextTF.text =self.titleArray[5];
}

@end

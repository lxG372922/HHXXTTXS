//
//  ForgetViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ForgetViewController.h"
#import "LoginView.h"

@interface ForgetViewController ()

@property (nonatomic , strong)LoginView *loginV;

@end

@implementation ForgetViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    _loginV = [[LoginView alloc]initWithFrame:CGRectMake(0, TOP_BAR_HEIGHT, SCREEN_Width, SCREEN_HEIGHT-TOP_BAR_HEIGHT)];
    _loginV.backgroundColor = RGB(150, 150, 151);
    [_loginV getcreateWithViewFrame:3];
    [self.view addSubview:_loginV];
    
    
}

@end

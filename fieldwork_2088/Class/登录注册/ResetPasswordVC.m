//
//  ResetPasswordVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/31.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "ResetPasswordVC.h"

@interface ResetPasswordVC ()

@property (nonatomic,strong)MyLoginTextField *resetPwd;

@property (nonatomic,strong)MyLoginTextField *vertifyPwd;

@end

@implementation ResetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    
}

#pragma mark - UI
- (void)creatUI {
    [self.view addSubview:self.myScroll];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setFrame:CGRectMake(15, 33, 18, 18)];
    [backBtn setImage:[UIImage imageNamed:@"icon-back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *logoImageV = [[UIImageView alloc] initWithFrame:CGRectMake(App_Width/2.0 - 32, App_Height/4.0 - 5, 64, 64)];
    logoImageV.image = [UIImage imageNamed:@"icon-logo"];
    [self.view addSubview:logoImageV];

    UIButton *successBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [successBtn setTitle:@"完成" forState:UIControlStateNormal];
    [successBtn setTitleColor:Color_Text_Green forState:UIControlStateNormal];
    successBtn.titleLabel.font = Font_24;
    [successBtn setFrame:CGRectMake(App_Width/2.0 - 25, App_Height/2.0 + 100, 50, 30)];
    [successBtn addTarget:self action:@selector(resetSuccessBtnPressed:) forControlEvents:UIControlEventTouchUpInside];

    [self.myScroll addSubview:backBtn];
    [self.myScroll addSubview:logoImageV];
    [self.myScroll addSubview:self.resetPwd];
    [self.myScroll addSubview:self.vertifyPwd];
    [self.myScroll addSubview:successBtn];
}

- (MyLoginTextField *)resetPwd {
    if (!_resetPwd) {
        _resetPwd = [[MyLoginTextField alloc] initWithFrame:CGRectMake(44, App_Height/2.0 - 40, App_Width - 88, 40) image:@"icon-password" placeHolder:@"请输入密码"];
    }
    return _resetPwd;
}
- (MyLoginTextField *)vertifyPwd {
    if (!_vertifyPwd) {
        _vertifyPwd = [[MyLoginTextField alloc] initWithFrame:CGRectMake(44, App_Height/2.0 + 20, App_Width - 88, 40) image:@"icon-password" placeHolder:@"请再次输入密码"];
    }
    return _vertifyPwd;
}

#pragma mark - Action
- (void)backBtnPressed:(id)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)resetSuccessBtnPressed:(id)btn {
    UIViewController *vc = self;
    while (vc.presentingViewController) {
        vc = vc.presentingViewController;
    }
    [vc dismissViewControllerAnimated:YES completion:nil];
}

@end

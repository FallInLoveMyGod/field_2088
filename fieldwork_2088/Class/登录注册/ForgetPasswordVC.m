//
//  ForgetPasswordVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/31.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "ForgetPasswordVC.h"

#import "ResetPasswordVC.h"

@interface ForgetPasswordVC ()

@property (nonatomic,strong)MyLoginTextField *username;

@property (nonatomic,strong)MyLoginTextField *vertifyCode;

@property (nonatomic,strong)UILabel *btnLab;

@end

@implementation ForgetPasswordVC

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
    
    UIImageView *logoImageV = [[UIImageView alloc] initWithFrame:CGRectMake(App_Width/2.0 - 32, App_Height/5.0 - 5, 64, 64)];
    logoImageV.image = [UIImage imageNamed:@"icon-logo"];
    
    UIButton *getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    getCodeBtn.titleLabel.font = Font_16;
    [getCodeBtn setBackgroundColor:Color_UI_Background];
    [getCodeBtn addTarget:self action:@selector(getCodeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [getCodeBtn setFrame:CGRectMake(App_Width - 88 - 110, 5, 105, 30 )];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 1, 20)];
    line.backgroundColor = Color_Text_Green;
    
    self.btnLab = [[UILabel alloc] initWithFrame:CGRectMake( 11, 5, 90, 20)];
    self.btnLab.text = @"获取验证码";
    self.btnLab.textAlignment = NSTextAlignmentCenter;
    self.btnLab.textColor = Color_Text_Green;
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:Color_Text_Green forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn setFrame:CGRectMake(App_Width/2.0-40, App_Height/2.0 + 100, 80, 30)];
    nextBtn.titleLabel.font = Font_24;
    
    [self.myScroll addSubview:backBtn];
    [self.myScroll addSubview:logoImageV];
    [self.myScroll addSubview:self.username];
    [self.myScroll addSubview:self.vertifyCode];
    [self.myScroll addSubview:nextBtn];
    
    [self.vertifyCode addSubview:getCodeBtn];
    
    [getCodeBtn addSubview:line];
    [getCodeBtn addSubview:self.btnLab];
    
}

- (MyLoginTextField *)username {
    if (!_username) {
        _username = [[MyLoginTextField alloc] initWithFrame:CGRectMake(44, App_Height/2.0 - 40, App_Width - 88, 40) image:@"icon-username" placeHolder:@"请输入用户名"];
    }
    return _username;
}

- (MyLoginTextField *)vertifyCode {
    if (!_vertifyCode) {
        _vertifyCode = [[MyLoginTextField alloc] initWithFrame:CGRectMake(44, App_Height/2.0 + 20, App_Width - 88, 40) image:@"icon-phone" placeHolder:@"验证码"];
        [_vertifyCode.textTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _vertifyCode;
}


#pragma mark - Action
//  返回
- (void)backBtnPressed:(id)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//  获取验证码
- (void)getCodeBtn:(id)btn {
    if (![ConfigFunction xfunc_isValidMobileNumber:self.username.textTF.text]) {
        return;
    }
    
    UIButton *tempBtn = btn;
    [tempBtn setTitle:@"1" forState:UIControlStateNormal];
    [tempBtn setBackgroundColor:[UIColor grayColor]];
    tempBtn.userInteractionEnabled = NO;
}

//  下一步
- (void)nextBtnPressed:(id)btn {
    if ([ConfigFunction xfunc_emptyWithString:self.vertifyCode.textTF.text]) {
        return;
    }
    ResetPasswordVC *resetVC = [[ResetPasswordVC alloc] init];
    [self presentViewController:resetVC animated:YES completion:nil];
}

- (void)textFieldDidChange:(UITextField *)textTF {
    if (textTF == self.vertifyCode.textTF) {
        if (textTF.text.length > 4) {
            textTF.text = [textTF.text substringToIndex:4];
        }
    }
}




@end

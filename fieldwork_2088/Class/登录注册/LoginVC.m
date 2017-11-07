//
//  LoginVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/31.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "LoginVC.h"

#import "ForgetPasswordVC.h"

#define Test_Login1 @"http://192.168.8.80/javajy/index.php/Home/Index/login"

#import "RootVC.h"

@interface LoginVC ()

@property (nonatomic,strong)MyLoginTextField *username;

@property (nonatomic,strong)MyLoginTextField *password;


@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    
}

#pragma mark - UI 
- (void)creatUI {
    [self.view addSubview:self.myScroll];
    /*
     *    使用说明
    */
    UIButton *compainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [compainBtn setFrame:CGRectMake(App_Width - 90, 30, 75, 22)];
    [compainBtn setTitle:@"使用说明" forState:UIControlStateNormal];
    [compainBtn addTarget:self action:@selector(compainBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [compainBtn setTitleColor:Color_Text_Green forState:UIControlStateNormal];
    
    UIImageView *logoImageV = [[UIImageView alloc] initWithFrame:CGRectMake(App_Width/2.0 - 32, App_Height/4.0 - 5, 64, 64)];
    logoImageV.image = [UIImage imageNamed:@"icon-logo"];
    
    /*
     *    登录按钮
     */
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:Color_Text_Green forState:UIControlStateNormal];
    loginBtn.titleLabel.font = Font_24;
    [loginBtn setFrame:CGRectMake(App_Width/2.0 - 25, App_Height/2.0 + 100, 50, 30)];
    [loginBtn addTarget:self action:@selector(loginBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *forgetPWD = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetPWD setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPWD setTitleColor:Color_Text_Black forState:UIControlStateNormal];
    forgetPWD.titleLabel.font = Font_14;
    [forgetPWD setFrame:CGRectMake(App_Width/2.0 - 30, App_Height/2.0 + 145, 60, 18)];
    [forgetPWD addTarget:self action:@selector(forgetPWDPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.myScroll addSubview:logoImageV];
    [self.myScroll addSubview:compainBtn];
    [self.myScroll addSubview:self.username];
    [self.myScroll addSubview:self.password];
    [self.myScroll addSubview:loginBtn];
    [self.myScroll addSubview:forgetPWD];

}

- (MyLoginTextField *)username {
    if (!_username) {
        _username = [[MyLoginTextField alloc] initWithFrame:CGRectMake(44, App_Height/2.0 - 40, App_Width - 88, 40) image:@"icon-username" placeHolder:@"请输入用户名"];
    }
    return _username;
}
- (MyLoginTextField *)password {
    if (!_password) {
        _password = [[MyLoginTextField alloc] initWithFrame:CGRectMake(44, App_Height/2.0 + 20, App_Width - 88, 40) image:@"icon-password" placeHolder:@"请输入您的密码"];
        _password.textTF.secureTextEntry = YES;
    }
    return _password;
}

#pragma mark - Action
//  使用说明
- (void)compainBtnPressed:(id)btn {
    
}

//  登录
- (void)loginBtnPressed:(id)btn {
    /*
    if ([ConfigFunction xfunc_emptyWithString:self.username.textTF.text]) {
        [ConfigFunction xfunc_OpenHudWithMessage:@"用户名不能为空" toView:self.view];
        return;
    }
    if (![ConfigFunction xfunc_isValidMobileNumber:self.username.textTF.text]) {
        [ConfigFunction xfunc_OpenHudWithMessage:@"用户名不合法" toView:self.view];
        return;
    }
    
    
    if ([self respondsToSelector:@selector(requestLoginData)]) {
        [self requestLoginData];
    }
     */
    RootVC *rootvc = [[RootVC alloc] init];
    AppDelegate *delegate = [ConfigFunction xfunc_getAppDelegate];
    delegate.window.rootViewController = rootvc;
    [SettingManager shareManager].managerID = @"0";
    
    
    /*
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = @"1234567789";
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:hud];
    
    [hud hideAnimated:YES afterDelay:2.0];
    [hud setRemoveFromSuperViewOnHide:YES];
    hud = nil;
    */
}

//  忘记密码
- (void)forgetPWDPressed:(id)btn {
    ForgetPasswordVC *forgetVC = [[ForgetPasswordVC alloc] init];
    [self presentViewController:forgetVC animated:YES completion:nil];
}

#pragma mark - 服务器
- (void)requestLoginData {
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    [para setObject:@"13916767645" forKey:@"username"];
//    [para setObject:@"123456" forKey:@"userpwd"];
    [para setObject:self.username.textTF.text forKey:@"username"];
    [para setObject:self.password.textTF.text forKey:@"userpwd"];

    
    [RequestFunction requestPostWithUrl:[NSString stringWithFormat:@"%@%@",Root_Api_String,Login_String] target:self selector:@selector(responseLoginData:) parameter:para];
}

- (void)responseLoginData:(NSArray *)info {
    if (info == nil) {
        return;
    }
    if ([[info valueForKey:@"message"] isEqualToString:@"登录成功！"]) {
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:App_LoginTarget];
        [[NSUserDefaults standardUserDefaults] synchronize];
        RootVC *rootvc = [[RootVC alloc] init];
        AppDelegate *delegate = [ConfigFunction xfunc_getAppDelegate];
        delegate.window.rootViewController = rootvc;
    }
}

@end

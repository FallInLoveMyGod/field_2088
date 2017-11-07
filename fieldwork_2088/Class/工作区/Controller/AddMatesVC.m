//
//  AddMatesVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/8.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "AddMatesVC.h"

@interface AddMatesVC ()

@property (nonatomic,strong)UIScrollView *myScrollView;

@property (nonatomic,strong)MyInfoTextField *nickTF;

@property (nonatomic,strong)MyInfoTextField *phoneTF;

@property (nonatomic,strong)MyInfoTextField *mailTF;

@property (nonatomic,strong)UIButton *manBtn;

@property (nonatomic,strong)UIButton *womenBtn;


@end

@implementation AddMatesVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self creatUI];
    
}

#pragma mark - UI
- (void)creatUI {
    MyCardView *cardView = [[MyCardView alloc] initWithFrame:CGRectMake(20, 20, App_Width - 40, 194)];
    cardView.backgroundColor = [UIColor whiteColor];
    
    UIButton *womenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [womenBtn setImage:[UIImage imageNamed:@"icon-women"] forState:UIControlStateNormal];
    [womenBtn setFrame:CGRectMake(App_Width / 2.0 - 20 - 48, 143, 24, 24)];
    [womenBtn addTarget:self action:@selector(womenBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *womenLab = [[UILabel alloc] initWithFrame:CGRectMake(App_Width / 2.0 - 20 - 48, 171, 24, 18)];
    womenLab.text = @"女";
    womenLab.font = Font_14;
    womenLab.textColor = Color_Text_Gray9;
    self.womenBtn = womenBtn;
    
    UIButton *manBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [manBtn setImage:[UIImage imageNamed:@"icon-man"] forState:UIControlStateNormal];
    [manBtn setFrame:CGRectMake(App_Width / 2.0 - 20 + 24, 143, 24, 24)];
    [manBtn addTarget:self action:@selector(manBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *manLab = [[UILabel alloc] initWithFrame:CGRectMake(App_Width / 2.0 - 20 + 24, 171, 24, 18)];
    manLab.text = @"男";
    manLab.font = Font_14;
    manLab.textColor = Color_Text_Gray9;
    self.manBtn = manBtn;
    
    MyCardView *remarksCardView = [[MyCardView alloc] initWithFrame:CGRectMake(20, 234, App_Width - 40, 194)];
    remarksCardView.backgroundColor = [UIColor whiteColor];
    
    UIButton *resaveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [resaveBtn setImage:[UIImage imageNamed:@"icon-save"] forState:UIControlStateNormal];
    [resaveBtn addTarget:self action:@selector(resaveBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [resaveBtn setFrame:CGRectMake(App_Width/2.0 - 37, 446, 74, 30)];
    
    [self.view addSubview:self.myScrollView];
    [self.myScrollView addSubview:cardView];
    [self.myScrollView addSubview:remarksCardView];
    [self.myScrollView addSubview:resaveBtn];
    [cardView addSubview:self.nickTF];
    [cardView addSubview:self.phoneTF];
    [cardView addSubview:self.mailTF];
    [cardView addSubview:self.manBtn];
    [cardView addSubview:self.womenBtn];
    [cardView addSubview:manLab];
    [cardView addSubview:womenLab];
    
}

- (UIScrollView *)myScrollView {
    if (!_myScrollView) {
        _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height - 64)];
        _myScrollView.backgroundColor = Color_UI_Background;
        _myScrollView.contentSize = CGSizeMake(App_Width, App_Height );
        _myScrollView.showsVerticalScrollIndicator = NO;
    }
    return  _myScrollView;
}

- (MyInfoTextField *)nickTF {
    if (!_nickTF) {
        _nickTF = [[MyInfoTextField alloc] initWithFrame:CGRectMake(0, 10, App_Width - 40, 40) image:@"icon-username" placeHolder:@"请输入您的真实姓名"];
        _nickTF.textTF.font = Font_14;
    }
    return _nickTF;
}

- (MyInfoTextField *)phoneTF {
    if (!_phoneTF) {
        _phoneTF = [[MyInfoTextField alloc] initWithFrame:CGRectMake(0, 50, App_Width - 40, 40) image:@"icon-phone" placeHolder:@"请输入您的手机号码"];
        _phoneTF.textTF.font = Font_14;
    }
    return _phoneTF;
}

- (MyInfoTextField *)mailTF {
    if (!_mailTF) {
        _mailTF = [[MyInfoTextField alloc] initWithFrame:CGRectMake(0, 90, App_Width - 40, 40) image:@"icon-mail" placeHolder:@"请输入您的邮箱"];
        _mailTF.textTF.font = Font_14;
    }
    return _mailTF;
}

#pragma mark - Handle Action
- (void)womenBtnAction:(UIButton *)btn {
    
}

- (void)manBtnAction:(UIButton *)btn {
    
}

- (void)resaveBtnAction:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
}
@end

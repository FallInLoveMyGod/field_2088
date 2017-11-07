//
//  ApprovalAlertView.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/5.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "ApprovalAlertView.h"

@implementation ApprovalAlertView

@synthesize avatarImageV;
@synthesize nickLab;
@synthesize agencyLab;
@synthesize textLab;
@synthesize timeLab;

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(0, 0, App_Width, App_Height)];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.backgroundColor = Color_Alart_Background;
    
    
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 10;
    contentView.clipsToBounds = YES;
    
    avatarImageV = [[UIImageView alloc] init];
    avatarImageV.backgroundColor = [UIColor cyanColor];
    avatarImageV.layer.cornerRadius = 0.104 * App_Width;
    avatarImageV.layer.borderWidth = 2;
    avatarImageV.layer.borderColor = Color_Text_Green.CGColor;
    avatarImageV.clipsToBounds = YES;
    
    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = Color_Text_Green;
    
    nickLab = [[UILabel alloc] init];
    nickLab.text = @"田耀琦.田耀琦";
    nickLab.textAlignment = NSTextAlignmentCenter;
    nickLab.backgroundColor = [UIColor whiteColor];
    nickLab.alpha = 1.0;
    nickLab.textColor = Color_Text_Black;
    nickLab.font = Font_Medium_12;
    
    UILabel *positonLab = [[UILabel alloc] init];
    positonLab.text = @"所属部门";
    positonLab.textAlignment = NSTextAlignmentCenter;
    positonLab.textColor = [UIColor whiteColor];
    positonLab.backgroundColor = Color_Text_Green;
    positonLab.font = Font_10;
    positonLab.layer.cornerRadius = 12;
    positonLab.clipsToBounds = YES;
    
    agencyLab = [[UILabel alloc] init];
    agencyLab.text = @"技术部";
    agencyLab.textColor = Color_Text_Green;
    agencyLab.font = Font_10;
    
    textLab = [[UILabel alloc] init];
    textLab.font = Font_10;
    textLab.text = @"肚子疼了肚子疼了肚子疼了肚子疼了肚子疼了肚子疼了肚子疼了肚子疼了肚子疼了肚子疼了肚子疼了肚子疼了肚子疼了肚子疼了肚子疼了肚子疼了";
    textLab.numberOfLines = 3;
    textLab.textColor = Color_Text_Gray9;
    
    UIView *lineView2 = [[UIView alloc] init];
    lineView2.backgroundColor = Color_Text_Green;
    
    UILabel *leaveDayLab = [[UILabel alloc] init];
    leaveDayLab.text = @"请假时间";
    leaveDayLab.textAlignment = NSTextAlignmentCenter;
    leaveDayLab.backgroundColor = [UIColor whiteColor];
    leaveDayLab.textColor = Color_Text_Black;
    leaveDayLab.font = Font_Medium_12;
    
    timeLab = [[UILabel alloc] init];
    timeLab.text = @"2017年6月6日 8:30 - 8:31";
    timeLab.textColor = Color_Text_Gray9;
    timeLab.font = Font_10;
    
    [self addSubview:contentView];
    [self addSubview:avatarImageV];
    [contentView addSubview:lineView1];
    [contentView addSubview:lineView2];
    [contentView addSubview:nickLab];
    [contentView addSubview:positonLab];
    [contentView addSubview:agencyLab];
    [contentView addSubview:textLab];
    [contentView addSubview:leaveDayLab];
    [contentView addSubview:timeLab];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(0.3 * App_Height);
        make.left.equalTo(self).offset(0.18 * App_Width);
        make.centerX.mas_equalTo(self);
        make.height.mas_equalTo(0.46 * App_Height);
    }];
    
    [avatarImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(contentView.mas_top);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(0.208 * App_Width, 0.208 * App_Width));
    }];

    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(0);
        make.right.equalTo(contentView);
        make.top.mas_equalTo(0.1 * App_Height);
        make.height.mas_equalTo(1);
    }];
    
    [nickLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(lineView1);
        make.left.equalTo(contentView).mas_offset(30);
        make.top.equalTo(contentView).mas_offset(0.1 * App_Height - 8);
        make.right.mas_greaterThanOrEqualTo(contentView).offset(-0.64 * App_Width + 60);
    }];
    
    
    [positonLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(30);
        make.top.equalTo(lineView1.mas_bottom).offset(13);
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    [agencyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(positonLab);
        make.left.equalTo(positonLab.mas_right).offset(15);
        make.size.mas_equalTo(CGSizeMake(100, 14));
    }];
    
    [textLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(contentView).multipliedBy(0.95);
        make.centerX.equalTo(contentView);
        make.size.mas_equalTo(CGSizeMake(0.64 * App_Width - 60, 54));
    }];
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(0.3 * App_Height);
        make.left.and.right.equalTo(contentView);
        make.height.mas_equalTo(1);
    }];
    
    [leaveDayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(30);
        make.size.mas_equalTo(CGSizeMake(50, 12));
        make.centerY.equalTo(lineView2);
    }];
    
    [timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(30);
        make.top.equalTo(leaveDayLab.mas_bottom).offset(14);
        make.size.mas_equalTo(CGSizeMake(0.64 * App_Width - 60, 12));
    }];
    
}

@end

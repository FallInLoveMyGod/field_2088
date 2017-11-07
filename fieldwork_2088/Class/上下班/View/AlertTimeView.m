//
//  AlertTimeView.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/9.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "AlertTimeView.h"

#import "ClockView.h"

@implementation AlertTimeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    _handleView = [[UIView alloc] initWithFrame:CGRectMake(20, 0.18 * App_Height + 64, App_Width - 40, 0.54 * App_Height + 18)];
    _handleView.backgroundColor = [UIColor clearColor];
    [self addSubview:_handleView];

    MyCardView *cardView = [[MyCardView alloc] initWithFrame:CGRectMake(0, 0, App_Width - 40, 0.54 * App_Height )];
    cardView.backgroundColor = [UIColor whiteColor];

    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, App_Width - 40, 0.34 * App_Height)];
    imageV.image = [UIImage imageNamed:@"alert_background"];
    imageV.backgroundColor = [UIColor clearColor];
    
    UILabel *tipLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 6, App_Width - 120, 18)];
    tipLab.text = @"温馨提示：您今天还未打卡！";
    tipLab.font = Font_14;
    tipLab.textColor = [UIColor whiteColor];
    tipLab.textAlignment = NSTextAlignmentCenter;
    
    UILabel *dateLab = [[UILabel alloc] initWithFrame:CGRectMake(App_Width - 40 - 155 , 0.115 * App_Height, 145, 22)];
    dateLab.text = @"2017年15月15日";
    dateLab.font = Font_18;
    dateLab.textColor = [UIColor whiteColor];
    dateLab.textAlignment = NSTextAlignmentCenter;
    
    UILabel *timeLab = [[UILabel alloc] initWithFrame:CGRectMake(App_Width - 40 - 155, 0.115 * App_Height + 25, 145, 18)];
    timeLab.text = @"AM 7:50";
    timeLab.textAlignment = NSTextAlignmentCenter;
    timeLab.font = Font_14;
    timeLab.textColor = [UIColor whiteColor];
    
    ClockView *clock = [[ClockView alloc] initWithFrame:CGRectMake(20, 0.09 * App_Height, 0.288 * App_Width, 0.288 * App_Width)];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0.44 * App_Height , App_Width - 40, 1)];
    line.backgroundColor = Color_Line;
    
    UIImageView *morningImageV = [[UIImageView alloc] initWithFrame:CGRectMake(25, 0.39 * App_Height - 7, 14, 14)];
    morningImageV.image = [UIImage imageNamed:@"time-morning"];
    
    UIImageView *afternoonImageV = [[UIImageView alloc] initWithFrame:CGRectMake(25, 0.49 * App_Height - 7 , 14, 14)];
    afternoonImageV.image = [UIImage imageNamed:@"time-afternoon"];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setFrame:CGRectMake(App_Width/2.0 - 20 - 18, 0.54 * App_Height - 18, 36, 36)];
    [closeBtn setImage:[UIImage imageNamed:@"btn-close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeAlertBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_handleView];
    [_handleView addSubview:cardView];
    [cardView addSubview:imageV];
    [cardView addSubview:line];
    [cardView addSubview:morningImageV];
    [cardView addSubview:afternoonImageV];
    [cardView addSubview:self.morningLab];
    [cardView addSubview:self.afternoonLab];
    [cardView addSubview:self.morningBtn];
    [cardView addSubview:self.afternoonBtn];
    [cardView addSubview:closeBtn];
    
    [imageV addSubview:tipLab];
    [imageV addSubview:dateLab];
    [imageV addSubview:timeLab];
    [imageV addSubview:self.avatarImageV];
    [imageV addSubview:clock];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(labScroll:) userInfo:tipLab repeats:YES];
    [timer fire];
}

- (UILabel *)morningLab {
    if (!_morningLab) {
        _morningLab = [[UILabel alloc] initWithFrame:CGRectMake(47, 0.39 * App_Height - 9, 100, 18)];
        _morningLab.text = @"00:00";
        _morningLab.font = Font_SFNSText_16;
        _morningLab.textColor = Color_Text_Time;
    }
    return _morningLab;
}

- (UILabel *)afternoonLab {
    if (!_afternoonLab) {
        _afternoonLab = [[UILabel alloc] initWithFrame:CGRectMake(47, 0.49 * App_Height - 9, 100, 18)];
        _afternoonLab.text = @"00:00";
        _afternoonLab.textColor = Color_Text_Time;
        _afternoonLab.font = Font_SFNSText_16;
    }
    return _afternoonLab;
}

- (UIButton *)morningBtn {
    if (!_morningBtn) {
        _morningBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_morningBtn setImage:[UIImage imageNamed:@"icon-choose"] forState:UIControlStateNormal];
        [_morningBtn setFrame:CGRectMake(App_Width - 40 - 25 - 20, 0.39 * App_Height - 10, 20, 20)];
    }
    return _morningBtn;
}

- (UIButton *)afternoonBtn {
    if (!_afternoonBtn) {
        _afternoonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_afternoonBtn setImage:[UIImage imageNamed:@"icon-unchoose"] forState:UIControlStateNormal];
        [_afternoonBtn setFrame:CGRectMake(App_Width - 40 - 25 - 20, 0.49 * App_Height - 10, 20, 20)];
    }
    return _afternoonBtn;
}

- (UIImageView *)avatarImageV {
    if (!_avatarImageV) {
        //_avatarImageV = [[UIImageView alloc] initWithFrame:CGRectMake(40, 6, App_Width - 120, 18)];
        _avatarImageV = [[UIImageView alloc] initWithFrame:CGRectMake(App_Width - 40 - 106, 0.115 * App_Height + 48 , 43, 43)];
        _avatarImageV.image = [UIImage imageNamed:@"icon-avatar-default"];
    }
    return _avatarImageV;
}

#pragma mark - Action
- (void)closeAlertBtn:(id)btn {
    [self hide];
}

- (void)labScroll:(NSTimer *)timer {
    UILabel *tempLab = (UILabel *)[timer userInfo];
    CGRect newRect = tempLab.frame;
    NSString *string = tempLab.text;
    CGFloat x = newRect.origin.x;
    if (x > -newRect.size.width) {
        newRect.origin.x = x - 30;
        [UIView animateWithDuration:1.5 animations:^{
            tempLab.frame = newRect;
        }];
    }
    else {
        tempLab.text = @"";
        newRect.origin.x = App_Width - 40;
        tempLab.frame = newRect;
        tempLab.text = @"string";
    }
}

@end

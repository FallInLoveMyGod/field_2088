//
//  RouteListCell.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/8/11.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "RouteListCell.h"

@implementation RouteListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.backgroundColor = [UIColor clearColor];
    MyCardView *card = [[MyCardView alloc] initWithFrame:CGRectMake(14, 2, App_Width - 28 , 70)];
    card.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:card];
    
    [card addSubview:self.signLab];
    [card addSubview:self.nameLab];
    [card addSubview:self.detailLab];
}

- (UILabel *)signLab {
    if (!_signLab) {
        _signLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 12, 48, 48)];
        _signLab.text = [@"田耀琦" substringToIndex:1];
        _signLab.textColor = [UIColor whiteColor];
        _signLab.backgroundColor = Color_Random;
        _signLab.textAlignment = NSTextAlignmentCenter;
        
        _signLab.layer.cornerRadius = 24;
        _signLab.clipsToBounds = YES;
    }
    return _signLab;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 27, 80, 18)];
        _nameLab.text = @"田耀琦";
        _nameLab.font = Font_Medium_18;
        _nameLab.textColor = Color_Text_Gray9;
    }
    return _nameLab;
}

- (UILabel *)detailLab {
    if (!_detailLab) {
        _detailLab = [[UILabel alloc] initWithFrame:CGRectMake(160, 29, App_Width - 28 - 160 - 15, 14)];
        _detailLab.text = @"查看历史轨迹详情";
        _detailLab.font = Font_14;
        _detailLab.textAlignment = NSTextAlignmentRight;
        _detailLab.textColor = Color_Button_Background;
    }
    return _detailLab;
}



@end

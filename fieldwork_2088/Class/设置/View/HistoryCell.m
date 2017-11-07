//
//  HistoryCell.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/2.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "HistoryCell.h"

@implementation HistoryCell

@synthesize workInTimeLab;
@synthesize workOutTimeLab;
@synthesize dateLab;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    [self.contentView setBackgroundColor:Color_UI_Background];
    
    MyCardView *cardView = [[MyCardView alloc] initWithFrame:CGRectMake(App_Width * 4  / 75.0, 10, App_Width * 67 / 75.0, 88)];
    cardView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:cardView];
    
    UIImageView *moringImageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 14, 14 )];
    moringImageV.image = [UIImage imageNamed:@"time-morning"];
    
    workInTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(41, 18, 160, 18)];
    workInTimeLab.text = @"上班时间：08:24";
    workInTimeLab.font = Font_Medium_14;
    workInTimeLab.textColor = Color_Text_Black;
    
    dateLab = [[UILabel alloc] initWithFrame:CGRectMake(App_Width * 62 / 75.0 - 66, 18, 66, 22)];
    dateLab.text = @"04月10日";
    dateLab.textAlignment = NSTextAlignmentCenter;
    dateLab.font = Font_12;
    dateLab.textColor = Color_Text_Black;
    dateLab.layer.borderWidth = 1;
    dateLab.layer.borderColor = Color_Text_Green.CGColor;
    dateLab.layer.cornerRadius = 11;
    dateLab.clipsToBounds = YES;
    
    UIImageView *afternoonImageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 54, 14, 14)];
    afternoonImageV.image = [UIImage imageNamed:@"time-afternoon"];
    
    workOutTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(41, 52, 160,  18)];
    workOutTimeLab.text = @"下班时间：05:30";
    workOutTimeLab.font = Font_Medium_14;
    workOutTimeLab.textColor = Color_Text_Black;
    
    UIButton *detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [detailBtn setTitle:@"查看详情" forState:UIControlStateNormal];
    detailBtn.backgroundColor = Color_Button_Background;
    [detailBtn addTarget:self action:@selector(detailBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [detailBtn setFrame:CGRectMake(App_Width * 62 / 75.0 - 66, 45, 66, 22)];
    detailBtn.titleLabel.font = Font_Medium_12;
    detailBtn.layer.cornerRadius = 11;
    detailBtn.clipsToBounds = YES;
    
    [cardView addSubview:moringImageV];
    [cardView addSubview:afternoonImageV];
    [cardView addSubview:workOutTimeLab];
    [cardView addSubview:workInTimeLab];
    [cardView addSubview:dateLab];
    [cardView addSubview:detailBtn];
    
}

- (void)detailBtnPressed:(UIButton *)btn {
    if (self.block) {
        self.block(btn.tag);
    }
}

@end

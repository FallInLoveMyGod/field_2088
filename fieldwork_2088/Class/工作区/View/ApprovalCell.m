//
//  ApprovalCell.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/5.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "ApprovalCell.h"

@implementation ApprovalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initView];
        
    }
    return self;
}

-(void)initView {
    [self.contentView setBackgroundColor:Color_UI_Background];
    
    MyCardView *cardView = [[MyCardView alloc] initWithFrame:CGRectMake(20, 10, App_Width - 40, 90)];
    cardView.backgroundColor = [UIColor whiteColor];
    
    UILabel *applicaterLab = [[UILabel alloc] initWithFrame:CGRectMake( 20, 18, 45, 18)];
    applicaterLab.text = @"申请人";
    applicaterLab.textColor = Color_Text_Green;
    applicaterLab.font = Font_Medium_14;
    
    self.nickLab = [[UILabel alloc] initWithFrame:CGRectMake(73, 18, 100, 18)];
    self.nickLab.text = @"田耀琦";
    self.nickLab.font = Font_14;
    self.nickLab.textColor = Color_Text_Black;
    
    self.textLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 48, App_Width - 40 - 40, 16)];
    self.textLab.text = @"张总，今天。。。。。请假10分钟";
    self.textLab.textColor = Color_Text_Gray9;
    self.textLab.font = Font_12;
    
    self.stateImageV = [[UIImageView alloc] initWithFrame:CGRectMake(App_Width - 40 -47, 10, 36, 36)];
    self.stateImageV.backgroundColor = [UIColor cyanColor];
    self.stateImageV.layer.cornerRadius = 18;
    self.stateImageV.layer.borderWidth = 1;
    self.stateImageV.clipsToBounds = YES;
    self.stateImageV.layer.borderColor = Color_Text_Green.CGColor;
    
    self.timeLab = [[UILabel alloc] initWithFrame:CGRectMake(App_Width - 40 - 20 - 60, 68, 60, 14)];
    self.timeLab.text = @"2017-06-06";
    self.timeLab.textColor = Color_Text_Gray;
    self.timeLab.textAlignment = NSTextAlignmentRight;
    self.timeLab.font = Font_10;
    
    [self.contentView addSubview:cardView];
    [cardView addSubview:applicaterLab];
    [cardView addSubview:self.nickLab];
    [cardView addSubview:self.textLab];
    [cardView addSubview:self.stateImageV];
    [cardView addSubview:self.timeLab];

}



@end

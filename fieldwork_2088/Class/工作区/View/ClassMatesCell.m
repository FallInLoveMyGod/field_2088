//
//  ClassMatesCell.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/8.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "ClassMatesCell.h"

@implementation ClassMatesCell

@synthesize nickLab;
@synthesize positionLab;
@synthesize telephoneLab;
@synthesize emailLab;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self initView];
    }
    return self;
}

- (void)initView {
    MyCardView *cardView = [[MyCardView alloc] initWithFrame:CGRectMake(App_Width / 20.0, 10, App_Width / 10.0 * 9, 151)];
    cardView.backgroundColor = [UIColor whiteColor];
    
    nickLab = [[UILabel alloc] init];
    nickLab.text = @"哈利波特";
    CGFloat width = [self getWidthFromString:nickLab.text Font:Font_Medium_18];
    nickLab.frame = CGRectMake(17, 20, width + 2, 20);
    nickLab.font = Font_Medium_18;
    
    positionLab = [[UILabel alloc] initWithFrame:CGRectMake(30 + width, 24, 100, 14)];
    positionLab.text = @"技术部经理";
    positionLab.font = Font_14;
    positionLab.textColor = Color_Text_Green;
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 54, App_Width / 10.0 * 9, 1)];
    lineView.backgroundColor = Color_Line;
    
    UIImageView *phoneImageV = [[UIImageView alloc] initWithFrame:CGRectMake(23, 74, 20, 20)];
    phoneImageV.image = [UIImage imageNamed:@"icon-phone"];
    
    telephoneLab = [[UILabel alloc] initWithFrame:CGRectMake(53, 76, 180, 18)];
    telephoneLab.text = @"18321510692";
    telephoneLab.font = Font_14;
    telephoneLab.textColor = Color_Text_Black;
    
    UIImageView *emailImageV = [[UIImageView alloc] initWithFrame:CGRectMake(23, 119, 20, 20)];
    emailImageV.image = [UIImage imageNamed:@"icon-mail"];
    
    emailLab = [[UILabel alloc] initWithFrame:CGRectMake(53, 120, 180, 18)];
    emailLab.text = @"1174465110@qq.com";
    emailLab.font = Font_14;
    emailLab.textColor = Color_Text_Black;
    
    [self.contentView addSubview:cardView];
    [cardView addSubview:nickLab];
    [cardView addSubview:positionLab];
    [cardView addSubview:lineView];
    [cardView addSubview:phoneImageV];
    [cardView addSubview:telephoneLab];
    [cardView addSubview:emailLab];
    [cardView addSubview:emailImageV];
    
    [self.nickLab addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

// 获取一定数量字数额宽度
- (CGFloat)getWidthFromString:(NSString *)str Font:(UIFont *)font {
    NSDictionary *attrs = @{NSFontAttributeName:font};
    CGSize size = [str sizeWithAttributes:attrs];
    return size.width;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

    NSString *string = self.nickLab.text;
    //NSDictionary *attrs = @{NSFontAttributeName:Font_Medium_18};
    //CGSize size = [string sizeWithAttributes:attrs];

    CGFloat width = [self getWidthFromString:string Font:Font_Medium_18];
    CGRect  rect = self.nickLab.frame;
    rect.size.width = width + 2;
    self.nickLab.frame = rect;
    
    CGRect rect2 = self.positionLab.frame;
    rect2.origin.x = width + 30;
    self.positionLab.frame = rect2;
}

- (void)dealloc {
    [self.nickLab removeObserver:self forKeyPath:@"text"];
}
@end

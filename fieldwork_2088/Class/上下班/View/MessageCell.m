
//
//  MessageCell.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/15.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    UIImageView *logoImageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 54, 54)];
    logoImageV.image = [UIImage imageNamed:@"icon-notice-logo"];
    
    [self.contentView addSubview:logoImageV];
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.contentLab];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(92, 19, App_Width - 92 - 20 - 70, 16)];
        _titleLab.text = @"天天国庆节";
        _titleLab.textColor = Color_Text_Black;
        _titleLab.font = Font_Medium_14;
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [[UILabel alloc] initWithFrame:CGRectMake(92, 38, App_Width - 92 - 20, 16)];
        _contentLab.text = @"重要的事情说3遍，国庆节放假一年！！！国庆节放假一年！！！国庆节放假一年！！！国庆节放假一年！！！";
        _contentLab.textColor = Color_Text_Gray9;
        _contentLab.font = Font_12;
    }
    return _contentLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(App_Width - 40 - 70, 24, 12, 70)];
        _timeLab.text = @"";
        _timeLab.textColor = Color_Text_Gray9;
        _timeLab.textAlignment = NSTextAlignmentRight;
        _timeLab.font = Font_10;
    }
    return _timeLab;
}

@end

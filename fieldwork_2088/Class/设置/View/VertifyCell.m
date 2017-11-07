//
//  VertifyCell.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/2.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "VertifyCell.h"

@implementation VertifyCell

@synthesize titleLab;
@synthesize contentTF;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.backgroundColor = [UIColor whiteColor];
    
    titleLab = [[UILabel alloc] init];
    titleLab.font  = Font_14;
    titleLab.text = @"企业名称";
    
    contentTF = [[UITextField alloc] init];
    contentTF.font = Font_12;
    contentTF.placeholder = @"巨雄实业有限公司";
    contentTF.textColor = Color_Text_Gray6;
    
    [self.contentView addSubview:titleLab];
    [self.contentView addSubview:contentTF];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0.053 * App_Width);
        make.top.equalTo(self.contentView).offset(10);
        make.height.mas_equalTo(20);
        make.right.mas_lessThanOrEqualTo(contentTF.mas_left).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    [contentTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleLab);
        make.height.mas_equalTo(16);
    }];
}


@end

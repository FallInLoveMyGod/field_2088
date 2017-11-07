//
//  SettingCell.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/1.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "SettingCell.h"

@interface SettingCell ()

@property (nonatomic,strong)UIImageView *imageV;

@property (nonatomic,strong)UILabel *titleLab;

@property (nonatomic,strong)UIImageView *detailImageV;



@end

@implementation SettingCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.backgroundColor = [UIColor whiteColor];
    self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 20, 20)];
    
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(63, 11, 150, 18)];
    self.titleLab.font = Font_14;
    self.titleLab.textColor = Color_Text_Black;
    self.titleLab.textAlignment = NSTextAlignmentLeft;
    
    self.detailImageV = [[UIImageView alloc] initWithFrame:CGRectMake(App_Width - 47, 12, 16, 16)];
    self.detailImageV.image = [UIImage imageNamed:@"setting-more"];
    
    [self.contentView addSubview:self.imageV];
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.detailImageV];
}

- (void)configWithDataArr:(NSArray *)arr {
    self.imageV.image = [UIImage imageNamed:arr[0]];
    self.titleLab.text = arr[1];
}

@end

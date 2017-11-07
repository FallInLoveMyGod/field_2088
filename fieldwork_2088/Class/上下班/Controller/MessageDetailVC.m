//
//  MessageDetailVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/15.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "MessageDetailVC.h"

@interface MessageDetailVC ()

@property (nonatomic,strong)UILabel *titleLab;

@property (nonatomic,strong)UILabel *contentLab;

@property (nonatomic,strong)UILabel *timeLab;

@property (nonatomic,strong)UILabel *departmentLab;

@end

@implementation MessageDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"公告详情";
}

#pragma mark - UI
- (void)creatUI {
    [self.view addSubview:self.myScroll];
    
    MyCardView *cardView = [[MyCardView alloc] initWithFrame:CGRectMake(20, 15, App_Width - 40, App_Height - 81)];
    cardView.backgroundColor = [UIColor whiteColor];
    [self.myScroll addSubview:cardView];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(20, 46.5, App_Width - 80, 1)];
    line.backgroundColor = Color_Text_Green;
    
    [cardView addSubview:line];
    [cardView addSubview:self.titleLab];
    [cardView addSubview:self.contentLab];
    [cardView addSubview:self.departmentLab];
    [cardView addSubview:self.timeLab];
    
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, App_Width - 80, 18)];
        _titleLab.text = @"2017年劳动节放假通知";
        _titleLab.textColor = Color_Text_Black;
        _titleLab.font = Font_Medium_14;
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 59, App_Width - 80, 18)];
        _contentLab.text = @"放年假了房国庆了放妇女节了放父亲接了放年假了房国庆了放妇女节了放父亲接了放年假了房国庆了放妇女节了放父亲接了放年假了房国庆了放妇女节了放父亲接了放年假了房国庆了放妇女节了放父亲接了放年假了房国庆了放妇女节了放父亲接了放年假了房国庆了放妇女节了放父亲接了";
        _contentLab.textColor = Color_Text_Gray6;
        _contentLab.font = Font_12;
        _contentLab.numberOfLines = 0;
        CGRect rect = [_contentLab.text boundingRectWithSize:CGSizeMake(App_Width - 80, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:Font_12} context:nil];
        _contentLab.frame = CGRectMake(20, 59, App_Width - 80, rect.size.height);
    }
    return _contentLab;
}

- (UILabel *)departmentLab {
    if (!_departmentLab) {
        _departmentLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 65 + self.contentLab.frame.size.height + 40, App_Width - 60 - 100, 18)];
        _departmentLab.text = @"行政人事部";
        _departmentLab.textColor = Color_Text_Black;
        _departmentLab.font = Font_Medium_14;
        _departmentLab.textAlignment = NSTextAlignmentRight;
    }
    return _departmentLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 65 + self.contentLab.frame.size.height + 60, App_Width - 60 - 100, 18)];
        _timeLab.text = @"2017年03月23日";
        _timeLab.textAlignment = NSTextAlignmentRight;
        _timeLab.textColor = Color_Text_Gray9;
        _timeLab.font = Font_12;
    }
    return _timeLab;
}

@end

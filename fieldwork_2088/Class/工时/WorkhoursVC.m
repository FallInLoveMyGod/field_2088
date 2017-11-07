//
//  WorkhoursVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/8/14.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "WorkhoursVC.h"

@interface WorkhoursVC ()

@property (nonatomic,strong)UILabel *allHours;

@property (nonatomic,strong)UILabel *remainHours;

@property (nonatomic,strong)UILabel *workedHours;

@property (nonatomic,strong)UILabel *leaveHours;

@end

@implementation WorkhoursVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"------------ 哈哈哈 ----------------");
    [self creatUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - interface
- (void)creatUI {
    UILabel *allHourLab = [[UILabel alloc] initWithFrame:CGRectMake(0.16*App_Width, 0.24 * App_Width, 130, 24)];
    allHourLab.text = @"总工作时长";
    allHourLab.textColor = Color_Text_Green;
    allHourLab.font = Font_24;
    
    UILabel *workedHour = [[UILabel alloc] initWithFrame:CGRectMake(0.4 * App_Width, 0.4 * App_Width, 105, 20)];
    workedHour.text = @"已工作时长";
    workedHour.textColor = Color_Text_Green;
    workedHour.font = Font_20;
    
    UILabel *remainHour = [[UILabel alloc] initWithFrame:CGRectMake(0.112 * App_Width, 0.3 * App_Height, 115, 18)];
    remainHour.text = @"剩余工作时长";
    remainHour.textColor = Color_Text_Green;
    remainHour.font = Font_18;
    
    UILabel *leaveHour = [[UILabel alloc] initWithFrame:CGRectMake(0.68 * App_Width, 0.69 * App_Width, 30, 14)];
    leaveHour.text = @"请假";
    leaveHour.textColor = Color_Text_Green;
    leaveHour.font = Font_14;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(16, 0.47 * App_Height, App_Width - 33, 0.53 * App_Height - 98)];
    //imageView.backgroundColor = [UIColor greenColor];
    imageView.image = [UIImage imageNamed:@"icon-workhours-background"];
    
    [self.view addSubview:allHourLab];
    [self.view addSubview:workedHour];
    [self.view addSubview:remainHour];
    [self.view addSubview:leaveHour];
    [self.view addSubview:imageView];
    [self.view addSubview:self.allHours];
    [self.view addSubview:self.remainHours];
    [self.view addSubview:self.workedHours];
    [self.view addSubview:self.leaveHours];
    
}

- (UILabel *)allHours {
    if (!_allHours) {
        _allHours = [[UILabel alloc] initWithFrame:CGRectMake(0.16 * App_Width + 135, 0.24 * App_Width, 78, 24)];
        //_allHours.text = @"2088h";
         NSMutableAttributedString *attStr = [self transformStringWithString:@"2088h" font:Font_24];
        _allHours.attributedText = attStr;
    }
    return _allHours;
}

- (UILabel *)workedHours {
    if (!_workedHours) {
        _workedHours = [[UILabel alloc] initWithFrame:CGRectMake(0.4 * App_Width + 108, 0.4 * App_Width, 60, 20)];
        //_workedHours.text = @"2208h";
        NSMutableAttributedString *attStr = [self transformStringWithString:@"2088h" font:Font_18];
        _workedHours.attributedText = attStr;
    }
    return _workedHours;
}

- (UILabel *)remainHours {
    if (!_remainHours) {
        _remainHours = [[UILabel alloc] initWithFrame:CGRectMake(0.112 * App_Width + 120, 0.3 * App_Height, 60, 18)];
        //_remainHours.text = @"2088h";
         NSMutableAttributedString *attStr = [self transformStringWithString:@"2088h" font:Font_18];
        _remainHours.attributedText = attStr;
    }
    return _remainHours;
}

- (UILabel *)leaveHours {
    if (!_leaveHours) {
        _leaveHours = [[UILabel alloc] initWithFrame:CGRectMake(0.68 * App_Width + 34, 0.69 * App_Width, 60, 14)];
        //_leaveHours.text = @"2088h";
         NSMutableAttributedString *attStr = [self transformStringWithString:@"2088h" font:Font_14];
        _leaveHours.attributedText = attStr;
    }
    return _leaveHours;
}

#pragma mark - Methods
- (NSMutableAttributedString *)transformStringWithString:(NSString *)string font:(UIFont *)font {
    NSDictionary *attributeDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSFontAttributeName:font};
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:string attributes:attributeDic];
    return content;
}
@end

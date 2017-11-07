//
//  CalendarView.m
//  Canadar
//
//  Created by 田耀琦 on 2017/6/6.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "CalendarView.h"

@implementation CalendarView



- (id)initWithFrame:(CGRect)frame date:(NSDate *)date {
    self = [super initWithFrame:frame];
    if (self) {
        self.myDate = date;
        [self creatCalendarWithDate:self.myDate];
    }
    return self;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, self.frame.size.width - 40, 30)];
        _titleLab.font = Font_Avenir_24;
        _titleLab.textColor = Color_Text_Green;
    }
    return _titleLab;
}

- (NSMutableArray *)btnArr {
    if (!_btnArr) {
        _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}


- (void)setMyDate:(NSDate *)myDate {
    _myDate = myDate;
    [self creatCalendarWithDate:_myDate];
}


- (void)creatCalendarWithDate:(NSDate *)date {
    self.titleLab.text = [self stringFromDate:date];
    [self addSubview:self.titleLab];
    
    NSInteger firstDay = [self firstDayInThisMonth:date];
    NSInteger totalDay = [self totalDaysInThisMonth:date];
    if (self.btnArr.count != 0) {
        for (UIButton *tempBtn in self.btnArr) {
            [tempBtn removeFromSuperview];
        }
    }

    for (int i = 0; i < 42; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        int x = self.frame.size.width / 7.0 * (i % 7);
        int y = 25 * (i / 7) + 40;
        [btn setFrame:CGRectMake(x + 10, y, 25, 25)];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:Color_Text_Gray9 forState:UIControlStateNormal];
        
        btn.layer.cornerRadius = 12.5;
        btn.clipsToBounds = YES;
        
        [self addSubview:btn];
        
        if (i < firstDay) {
            
        }
        else if (i > firstDay - 1 + totalDay) {
            
        }
        else {
            [btn setTitle:[NSString stringWithFormat:@"%ld",i - firstDay + 1] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(calendarChoosed:) forControlEvents:UIControlEventTouchUpInside];
            [self.btnArr addObject:btn];
        }
        btn.tag = [btn.titleLabel.text integerValue] + 600;
        
    }
}

// 获取这个月第一天在周几
- (NSInteger)firstDayInThisMonth:(NSDate *)date {
    // NSLog(@"%@",date);
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:1];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
   // NSLog(@"%@",firstDayOfMonthDate);
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [firstDayOfMonthDate  dateByAddingTimeInterval: interval];
    // NSLog(@"enddate=%@",localeDate);
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:localeDate]; // 这个月第一天在当前日历的顺序
    // 返回某个特定时间(date)其对应的小的时间单元(smaller)在大的时间单元(larger)中的顺序
    return firstWeekday - 1;
}

//  算出给定时间的所在月的天数
- (NSInteger )totalDaysInThisMonth:(NSDate *)date {
    NSRange range = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

- (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy.MM"];
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

#pragma mark - Action 
- (void)calendarChoosed:(UIButton *)btn {
    for (UIButton *btn in self.btnArr) {
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:Color_Text_Gray9 forState:UIControlStateNormal];
    }
    if (self.block) {
        btn.backgroundColor = Color_Button_Background;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.block(btn.tag);
    }
}
@end

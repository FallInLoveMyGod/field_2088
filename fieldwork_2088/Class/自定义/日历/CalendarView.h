//
//  CalendarView.h
//  Canadar
//
//  Created by 田耀琦 on 2017/6/6.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 *   单元日历
 */

@interface CalendarView : UIView

@property (nonatomic,strong)NSDate *myDate;

@property (nonatomic,strong)UILabel *titleLab;

@property (nonatomic,copy)TagBtnBlock block;

@property (nonatomic,strong)NSMutableArray *btnArr;



- (id)initWithFrame:(CGRect)frame date:(NSDate *)date;

- (void)creatCalendarWithDate:(NSDate *)date;



@end

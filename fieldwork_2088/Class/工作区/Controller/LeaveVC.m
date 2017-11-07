//
//  LeaveVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/6.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "LeaveVC.h"

#import "Calendar.h"
#import "MyCustonTextView.h"

@interface LeaveVC () <UIScrollViewDelegate>
{
    BOOL _isStart;     // 点击的是请假开始  结束
}

@property (nonatomic,strong)UIScrollView *myScrollView;

@property (nonatomic,strong)Calendar *calendar;

@property (nonatomic,strong)UISlider *slider;

@property (nonatomic,strong)UILabel *startLab;

@property (nonatomic,strong)UILabel *endLab;

@property (nonatomic,strong)UIView *lineView;

@property (nonatomic,strong)MyCustonTextView *myTextView;

@end

@implementation LeaveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"请假";
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

#pragma mark - UI
- (void)creatUI {
    // 日历
    MyCardView *cardView = [[MyCardView alloc] initWithFrame:CGRectMake(20, 20, App_Width - 40, 244)];
    cardView.backgroundColor = [UIColor whiteColor];
    
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.frame = CGRectMake(10, 10, App_Width/2.0 - 40 , 24);
    [startBtn setTitle:@"开始日期" forState:UIControlStateNormal];
    [startBtn setTitleColor:Color_Button_Background forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startDateBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    startBtn.titleLabel.font = Font_Medium_14;
    startBtn.tag = 670;
    
    UIButton *endBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    endBtn.frame = CGRectMake(App_Width/2.0 - 20 + 10, 10, App_Width/2.0 - 40 , 24);
    [endBtn setTitle:@"结束日期" forState:UIControlStateNormal];
    [endBtn setTitleColor:Color_Text_Black forState:UIControlStateNormal];
    [endBtn addTarget:self action:@selector(endDateBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    endBtn.titleLabel.font = Font_Medium_14;
    endBtn.tag = 671;
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, App_Width - 40, 1)];
    bottomLine.backgroundColor = Color_Line;
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43, App_Width / 2.0 - 20, 2)];
    lineView.backgroundColor = Color_Text_Green;
    self.lineView = lineView;
    
    //  SLider
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 286, App_Width - 40, 20)];
    slider.minimumValue = 0.0;
    slider.maximumValue = 60.0 * 24;
    slider.minimumTrackTintColor = Color_Text_Green;
    slider.maximumTrackTintColor = Color_Text_Green;
    [slider setThumbImage:[UIImage imageNamed:@"slider-thumb"] forState:UIControlStateNormal];
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    self.slider = slider;
    
    // 请假时间
    UIView *timeView = [[UIView alloc] initWithFrame:CGRectMake(0, 320, App_Width, 55)];
    
    UIImageView *morningImageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 9, 14, 14)];
    morningImageV.image = [UIImage imageNamed:@"time-morning"];
    
    UIImageView *afternoonImageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 32, 14, 14)];
    afternoonImageV.image = [UIImage imageNamed:@"time-afternoon"];
    
    //  请假输入内容
    MyCardView *textCardView = [[MyCardView alloc] initWithFrame:CGRectMake(20, 380, App_Width - 40, 135)];
    textCardView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 11, App_Width - 200, 18)];
    titleLab.text = @"请假事由";
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = Color_Text_Black;
    titleLab.font = Font_Medium_14;
    
    MyCustonTextView *myTextView = [[MyCustonTextView alloc] initWithFrame:CGRectMake(0, 42, App_Width - 40, 68)];
    myTextView.placeHolderLab.text = @"经理，今天家里有事，我走了，白白";
    myTextView.font = Font_12;
    self.myTextView = myTextView;
    
    UILabel *sendTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(App_Width - 40 - 100, 115, 90, 16)];
    sendTimeLab.text = @"2017-06-06";
    sendTimeLab.font = Font_10;
    sendTimeLab.textColor = Color_Text_Gray;
    sendTimeLab.textAlignment = NSTextAlignmentRight;
    
    //  审核
    MyCardView *approvalCard = [[MyCardView alloc] initWithFrame:CGRectMake(20, 525, App_Width - 40, 87)];
    approvalCard.backgroundColor = [UIColor whiteColor];
    
    UILabel *approvalTitle = [[UILabel alloc] initWithFrame:CGRectMake(80, 11, App_Width - 200, 18)];
    approvalTitle.text = @"选择审批人";
    approvalTitle.textColor = Color_Text_Black;
    approvalTitle.textAlignment = NSTextAlignmentCenter;
    approvalTitle.font = Font_Medium_14;
    
    // 提交
    UIButton *commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //[commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    //[commitBtn setBackgroundColor:Color_Text_Green];
    //commitBtn.titleLabel.font = Font_18;
    [commitBtn setImage:[UIImage imageNamed:@"icon-button-commit"] forState:UIControlStateNormal];
    [commitBtn setFrame:CGRectMake(App_Width/2.0 - 38, 632, 76, 36)];

    [self.view addSubview:self.myScrollView];
    [self.myScrollView addSubview:cardView];
    [self.myScrollView addSubview:slider];
    [self.myScrollView addSubview:timeView];
    [self.myScrollView addSubview:textCardView];
    [self.myScrollView addSubview:approvalCard];
    [self.myScrollView addSubview:commitBtn];
    
    [cardView addSubview:self.calendar];
    [cardView addSubview:startBtn];
    [cardView addSubview:endBtn];
    [cardView addSubview:bottomLine];
    [cardView addSubview:lineView];
    
    [timeView addSubview:morningImageV];
    [timeView addSubview:afternoonImageV];
    [timeView addSubview:self.startLab];
    [timeView addSubview:self.endLab];
    
    [textCardView addSubview:titleLab];
    [textCardView addSubview:myTextView];
    [textCardView addSubview:sendTimeLab];
    
    [approvalCard addSubview:approvalTitle];
    
    _isStart = YES;     // 默认选择的是 开始时间
}

- (UIScrollView *)myScrollView {
    if (!_myScrollView) {
        _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height - 64)];
        _myScrollView.backgroundColor = Color_UI_Background;
        _myScrollView.contentSize = CGSizeMake(App_Width, 705);
        _myScrollView.showsVerticalScrollIndicator = NO;
        _myScrollView.delegate = self;
    }
    return _myScrollView;
}

/*
 *    日历
 */
- (Calendar *)calendar {
    if (!_calendar) {
        _calendar = [[Calendar alloc] initWithFrame:CGRectMake(0, 22, App_Width - 60, 199)];
        
        __weak typeof (self) weakSelf = self;
        _calendar.currentView.block = ^(NSInteger tag){
            NSLog(@"tag == %ld",(long)tag);
            NSDate *myDate = _calendar.currentView.myDate;
            NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
            [dateformater setDateFormat:@"yyyy年MM月"];
            NSString *dateStr = [dateformater stringFromDate:myDate];
            NSInteger hour = (NSInteger)self.slider.value / 60;
            NSInteger minite = (NSInteger)self.slider.value % 60;
            NSString *hourStr = [ConfigFunction xfunc_getHourStringFromHour:(int)hour];
            NSString *miniteStr =[ConfigFunction xfunc_getMiniteStringFromMinite:(int)minite];
            if (_isStart) {
                
                weakSelf.startLab.text = [NSString stringWithFormat:@"%@%ld日%@:%@",dateStr,tag - 600,hourStr,miniteStr];
            }
            else {
                self.endLab.text = [NSString stringWithFormat:@"%@%ld日%@:%@",dateStr,tag - 600,hourStr,miniteStr];
            }
            
        };
    }
    return _calendar;
}

- (UILabel *)startLab {
    if (!_startLab) {
        NSString *dateStr = [ConfigFunction xfunc_getStringFromNow:[NSDate date]];
        _startLab = [[UILabel alloc] initWithFrame:CGRectMake(45, 8, 200, 16)];
        _startLab.text = dateStr;
        _startLab.font = Font_12;
        _startLab.textColor = Color_Text_Black;
    }
    return _startLab;
}

- (UILabel *)endLab {
    if (!_endLab) {
        NSString *dateStr = [ConfigFunction xfunc_getStringFromNow:[NSDate date]];
        _endLab = [[UILabel alloc] initWithFrame:CGRectMake(45, 31, 200, 16)];
        _endLab.text = dateStr;
        _endLab.font = Font_12;
        _endLab.textColor = Color_Text_Black;
    }
    return _endLab;
}

#pragma mark - Action
/*
 *    开始日期
 */
- (void)startDateBtnPressed:(UIButton *)btn {
    if (_isStart) {
        return;
    }
    else {
        [btn setTitleColor:Color_Text_Green forState:UIControlStateNormal];
        UIButton *tempBtn = (UIButton *)[self.view viewWithTag:671];
        [tempBtn setTitleColor:Color_Text_Black forState:UIControlStateNormal];
        CGRect rect = self.lineView.frame;
        rect.origin.x = 0;
        [UIView animateWithDuration:0.5 animations:^{
            self.lineView.frame = rect;
        }];
        _isStart = !_isStart;
    }
}

/*
 *    结束日期
 */
- (void)endDateBtnPressed:(UIButton *)btn {
    if (!_isStart) {
        return;
    }
    else {
        [btn setTitleColor:Color_Text_Green forState:UIControlStateNormal];
        UIButton *tempBtn = (UIButton *)[self.view viewWithTag:670];
        [tempBtn setTitleColor:Color_Text_Black forState:UIControlStateNormal];
        CGRect rect = self.lineView.frame;
        rect.origin.x = App_Width / 2.0 - 20;
        [UIView animateWithDuration:0.5 animations:^{
            self.lineView.frame = rect;
        }];
        _isStart = !_isStart;
    }
}
/*
 *    UISlider
 */
- (void)sliderAction:(UISlider *)slider {
    NSInteger hour = (NSInteger)slider.value / 60;
    NSInteger minite = (NSInteger)slider.value % 60;
    NSLog(@"time: %ld: %ld",(long)hour,(long)minite);
    
    NSString *hourStr = [ConfigFunction xfunc_getHourStringFromHour:(int)hour];
    NSString *miniteStr = [ConfigFunction xfunc_getMiniteStringFromMinite:(int)minite];
    
    if (_isStart) {
        NSString *dateStr;
        if (self.startLab.text.length == 16) {
            dateStr = [self.startLab.text substringToIndex:11];
        }
        else {
            dateStr = [self.startLab.text substringToIndex:10];
        }
        self.startLab.text = [NSString stringWithFormat:@"%@%@:%@",dateStr,hourStr,miniteStr];
    }
    else {
        NSString *dateStr;
        if (self.startLab.text.length == 16) {
            dateStr = [self.endLab.text substringToIndex:11];
        }
        else {
            dateStr = [self.endLab.text substringToIndex:10];
        }

        self.endLab.text = [NSString stringWithFormat:@"%@%@:%@",dateStr,hourStr,miniteStr];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //[self.myTextView endEditing:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return NO;
}

#pragma mark - Notification Action
- (void)keyboardWillShow:(NSNotification *)noti {
    NSDictionary *dic = [noti userInfo];
    CGRect keyboardRect = [[dic objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    self.myScrollView.frame = CGRectMake(0, 0, App_Width, App_Height - 64 - 64 - keyboardRect.size.height);
    
}

- (void)keyboardWillHide:(NSNotification *)noti {
    self.myScrollView.frame = CGRectMake(0, 0, App_Width, App_Height - 64);
}


@end

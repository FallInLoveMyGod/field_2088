//
//  AllVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/26.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "AllVC.h"

@interface AllVC ()

@end

@implementation AllVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view setBackgroundColor:Color_UI_Background];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (UIScrollView *)myScroll {
    if (!_myScroll) {
        _myScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height - 64)];
        [_myScroll setBackgroundColor:Color_UI_Background];
    }
    return _myScroll;
}

#pragma mark - Notification

- (void)keyboardWillShow:(NSNotification *)noti {
    NSDictionary *info = [noti userInfo];
    CGRect keyboardRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    if (keyboardRect.size.height >= App_Height/2.0 - 60) {
        self.myScroll.contentOffset = CGPointMake(0, keyboardRect.size.height - App_Height/2.0 + 80);
    }
}

- (void)keyboardWillHide:(NSNotification *)noti {
    self.myScroll.contentOffset = CGPointMake(0, 0);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
@end

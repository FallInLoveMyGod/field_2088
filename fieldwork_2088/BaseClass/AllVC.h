//
//  AllVC.h
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/26.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllVC : UIViewController

@property (nonatomic,strong)UIScrollView *myScroll;

- (void)keyboardWillShow:(NSNotification *)noti;

- (void)keyboardWillHide:(NSNotification *)noti;


@end

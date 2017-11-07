//
//  MyLoginTextField.h
//  TRR
//
//  Created by 田耀琦 on 2017/5/31.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Border_Color [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0]

@interface MyLoginTextField : UIView <UITextFieldDelegate>

@property (nonatomic,strong)NSString *myPlaceHolder;

@property (nonatomic,strong)NSString *imageStr;

@property (nonatomic,strong)UIImageView *imageV;

@property (nonatomic,strong)UITextField *textTF;


- (instancetype)initWithFrame:(CGRect)frame image:(NSString *)image placeHolder:(NSString *)placeHolder;


@end

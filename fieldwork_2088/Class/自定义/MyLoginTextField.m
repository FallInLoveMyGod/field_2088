//
//  MyLoginTextField.m
//  TRR
//
//  Created by 田耀琦 on 2017/5/31.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "MyLoginTextField.h"

@implementation MyLoginTextField

- (instancetype)initWithFrame:(CGRect)frame image:(NSString *)image placeHolder:(NSString *)placeHolder {
    self = [super initWithFrame:frame];
    if (self) {
        self.myPlaceHolder = placeHolder;
        self.imageStr = image;
        
        self.layer.cornerRadius = 20;
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = Border_Color.CGColor;
        self.clipsToBounds = YES;
        
        [self addSubview:self.textTF];
        [self addSubview:self.imageV];
    }
    return self;
}

- (UITextField *)textTF {
    if (!_textTF) {
        _textTF = [[UITextField alloc] initWithFrame:CGRectMake(60, 0, self.frame.size.width - 80, 40 )];
        _textTF.placeholder = self.myPlaceHolder;
        _textTF.delegate = self;
    }
    return _textTF;
}

- (UIImageView *)imageV {
    if (!_imageV) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 9, 21, 21)];
        _imageV.image = [UIImage imageNamed:self.imageStr];
    }
    return _imageV;
}

#pragma mark - UTextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self endEditing:YES];
    return YES;
}



@end

//
//  MyInfoTextField.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/8.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "MyInfoTextField.h"

@implementation MyInfoTextField

- (instancetype)initWithFrame:(CGRect)frame image:(NSString *)image placeHolder:(NSString *)placeHolder {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:image];
        self.placeHolder = placeHolder;
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 40, App_Width - 80, 1)];
        lineView.backgroundColor = Color_Line;
        
        [self addSubview:self.imageV];
        [self addSubview:self.textTF];
        [self addSubview:lineView];
    }
    return self;
}

- (UIImageView *)imageV {
    if (!_imageV) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 12.5, 20, 20 )];
        _imageV.image = self.image;
    }
    return _imageV;
}

- (UITextField *)textTF {
    if (!_textTF) {
        _textTF = [[UITextField alloc] initWithFrame:CGRectMake(55, 13.5, App_Width - 40 - 55, 18)];
        _textTF.placeholder = self.placeHolder;
    }
    return _textTF;
}
@end

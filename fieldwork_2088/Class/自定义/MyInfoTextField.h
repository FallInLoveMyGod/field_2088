//
//  MyInfoTextField.h
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/8.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInfoTextField : UIView

@property (nonatomic,strong)NSString *placeHolder;

@property (nonatomic,strong)UIImage *image;

@property (nonatomic,strong)UIImageView *imageV;

@property (nonatomic,strong)UITextField *textTF;

- (instancetype)initWithFrame:(CGRect)frame image:(NSString *)image placeHolder:(NSString *)placeHolder;

@end

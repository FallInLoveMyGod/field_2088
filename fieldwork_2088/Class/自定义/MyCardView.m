//
//  MyCardView.m
//  TRR
//
//  Created by 田耀琦 on 2017/6/1.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "MyCardView.h"

@implementation MyCardView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self updateLayer];
        
    }
    return self;
}

- (void)updateLayer {
    
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowColor = Color_Shadow.CGColor;

    self.layer.shadowRadius = 4.0;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    
    self.layer.cornerRadius = 5.0;

}

@end

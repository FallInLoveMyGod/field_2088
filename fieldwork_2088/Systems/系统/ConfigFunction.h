//
//  ConfigFunction.h
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/31.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppDelegate.h"

@interface ConfigFunction : NSObject

+ (BOOL)xfunc_emptyWithString:(NSString *)string;

+ (BOOL)xfunc_isValidMobileNumber:(NSString *)mobileNum;

+ (AppDelegate *)xfunc_getAppDelegate;

+ (NSString *)xfunc_getStringFromNow:(NSDate *)date;

+ (NSString *)xfunc_getHourStringFromHour:(int)hour;

+ (NSString *)xfunc_getMiniteStringFromMinite:(int)minite;

+ (CGSize)xfunc_getStringSizeWith:(NSString *)goalString withStringFont:(CGFloat)font withWidthOrHeight:(CGFloat)fixedSize isWidthFixed:(BOOL)isWidth;

+ (void)xfunc_OpenHudWithMessage:(NSString *)message toView:(UIView *)view;

+ (BOOL)xfunc_canConnectNet;

+ (BOOL)xfunc_canConnectWifi;

+ (int)getRandomNumber:(int)from to:(int)to;

@end

//
//  SettingManager.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/8/11.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "SettingManager.h"
static SettingManager *manager;
@implementation SettingManager

+ (SettingManager *)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SettingManager alloc] init];
    });
    return manager;
}




@end

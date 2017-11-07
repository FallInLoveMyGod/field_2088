//
//  SettingManager.h
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/8/11.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 *    初始化设置
*/

@interface SettingManager : NSObject

@property (nonatomic,strong)NSString *managerID; // “1”是员工，“0”管理员

@property (nonatomic,strong)NSString *lat;       //  经度

@property (nonatomic,strong)NSString *lon;     //  纬度

@property (nonatomic,strong)NSString *token;

@property (nonatomic,strong)NSString *userId;

@property (nonatomic,strong)NSString *login_id;

@property (nonatomic,assign)BOOL isLogin;

+ (SettingManager *)shareManager;

@end

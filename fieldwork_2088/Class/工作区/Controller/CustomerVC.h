//
//  CustomerVC.h
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/8.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "AllVC.h"

@interface CustomerVC : AllVC

@property (nonatomic,strong)NSString *type; // type="1" 从客户跳入; type="2"  从同事进入; type="3" 从员工管理跳入

@end

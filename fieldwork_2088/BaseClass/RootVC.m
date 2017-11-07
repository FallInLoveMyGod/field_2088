//
//  RootVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/26.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "RootVC.h"

#import "PunchCardVC.h"
#import "WorkServiceVC.h"
#import "SettingVC.h"
#import "WorkhoursVC.h"

@interface RootVC ()

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor grayColor];
    
    PunchCardVC *punchVC1 = [[PunchCardVC alloc] init];
    //PunchCardVC *punchVC2 = [[PunchCardVC alloc] init];
    WorkhoursVC *workhoursVC = [[WorkhoursVC alloc] init];
    WorkServiceVC *workVC = [[WorkServiceVC alloc] init];
    SettingVC *settingVC = [[SettingVC alloc] init];
    
    [self creatNAVC:punchVC1 title:@"打卡" imageName:@"icon-morning-default" selectedImage:@"icon-morning-press"];
    //[self creatNAVC:punchVC2 title:@"下班" imageName:@"icon-afternoon-default" selectedImage:@"icon-afternoon-press"];
    [self creatNAVC:workhoursVC title:@"工时" imageName:@"icon-afternoon-default" selectedImage:@"icon-afternoon-press"];
    [self creatNAVC:workVC title:@"工作区" imageName:@"icon-workArea-default" selectedImage:@"icon-workArea-press"];
    [self creatNAVC:settingVC title:@"设置" imageName:@"icon-setting-default" selectedImage:@"icon-setting-press"];
    
}

- (void)creatNAVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImage:(NSString *)selectedImage{
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.title = title;
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateSelected];

    [self addChildViewController:navc];
}


@end

//
//  WorkServiceVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/26.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "WorkServiceVC.h"

#import "ApprovalVC.h"
#import "LeaveVC.h"
#import "CustomerVC.h"

@interface WorkServiceVC ()

@end

@implementation WorkServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    
}

#pragma mark - UI
- (void)creatUI {
    //  考勤管理
    UIImageView *workView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 23, App_Width - 54, App_Height/4.2 )];
    workView.userInteractionEnabled = YES;
    workView.image = [UIImage imageNamed:@"card-kq"];
    [self.view addSubview:workView];
    
    for (int i = 0; i < 3; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake((0.165 * App_Width - 20) / 2.0 + 3 + (App_Width/3.0 - 20)  * i, 0.16 * App_Width, 0.16 * App_Width, 0.16 * App_Width)];
        
        btn.tag = 510 + i;
        btn.backgroundColor = [UIColor clearColor];
        [btn addTarget:self action:@selector(workSpaceBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [workView addSubview:btn];
    }

    //  通讯管理
    UIImageView *peopleImageV = [[UIImageView alloc] initWithFrame:CGRectMake(25, 23 + CGRectGetMaxY(workView.frame), App_Width - 54, App_Height/4.2)];
    peopleImageV.image = [UIImage imageNamed:@"card-tx"];
    peopleImageV.userInteractionEnabled = YES;
    [self.view addSubview:peopleImageV];
    
    for (int i = 0; i < 2; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake((0.17 * App_Width - 20) / 2.0 + (App_Width/3.0 - 20)  * i, 0.16 * App_Width, 0.16 * App_Width, 0.16 * App_Width)];
        btn.tag = 515 + i;
        btn.backgroundColor = [UIColor clearColor];
        [btn addTarget:self action:@selector(workSpaceBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [peopleImageV addSubview:btn];
    }

}

#pragma mark - Action
// 510-512 考勤管理   515 516 通讯管理
- (void)workSpaceBtnPressed:(UIButton *)btn {
    switch (btn.tag) {
        case 510:
            
            break;
        case 511:
        {
            LeaveVC *leaveVC = [[LeaveVC alloc] init];
            leaveVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:leaveVC animated:YES];
        }
            
            break;
        case 512:
        {
            ApprovalVC *approvalVC = [[ApprovalVC alloc] init];
            approvalVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:approvalVC animated:YES];
        }
            
            break;
        case 515:
        {
            CustomerVC *customerVC = [[CustomerVC alloc] init];
            customerVC.type = @"1";
            customerVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:customerVC animated:YES];
        }
            break;
        case 516:
        {
            CustomerVC *customerVC = [[CustomerVC alloc] init];
            customerVC.type = @"2";
            customerVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:customerVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

@end

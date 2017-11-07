//
//  StartVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/27.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "StartVC.h"

#import "LoginVC.h"

// 引导页
@interface StartVC () <UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *scrollV;

@end

@implementation StartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];

}

- (void)viewWillAppear:(BOOL)animated {
    
}

#pragma mark - UI
- (void)creatUI {
    
    self.scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height)];
    self.scrollV.contentSize = CGSizeMake(App_Width * 3, App_Height);
    self.scrollV.bounces = NO;
    self.scrollV.delegate = self;
    self.scrollV.pagingEnabled = YES;
    self.scrollV.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollV];
    
    for (int i = 0; i < 3; i ++) {
        NSString *imageString = [NSString stringWithFormat:@"launchImage%d",i];
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(App_Width * i, 0, App_Width, App_Height)];
        imageV.image = [UIImage imageNamed:imageString];
        [self.scrollV addSubview:imageV];
    }
    
    UIButton *enterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [enterBtn setFrame:CGRectMake(App_Width * 2.5 - 60.5, App_Height - 85, 121, 33)];
    [enterBtn addTarget:self action:@selector(enterApp:) forControlEvents:UIControlEventTouchUpInside];
    [enterBtn setImage:[UIImage imageNamed:@"icon-launchBtn"] forState:UIControlStateNormal];
    [self.scrollV addSubview:enterBtn];
}

- (void)enterApp:(UIButton *)btn {
    AppDelegate *delegate = [ConfigFunction xfunc_getAppDelegate];
    delegate.window.rootViewController = [[LoginVC alloc] init];
}


@end

//
//  ApprovalVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/5.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "ApprovalVC.h"

#import "ApprovalCell.h"
#import "ApprovalAlertView.h"

@interface ApprovalVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *mytable;

@property (nonatomic,strong)ApprovalAlertView *alertView;

@property (nonatomic,strong)UIButton *deleteBtn;

@property (nonatomic,strong)UIButton *resultBtn;


@end

@implementation ApprovalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"审批";
}

#pragma mark - UI
- (void)creatUI {
    self.mytable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height - 64) style:UITableViewStyleGrouped];
    self.mytable.delegate = self;
    self.mytable.dataSource = self;
    self.mytable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.mytable];
}

- (ApprovalAlertView *)alertView {
    if (!_alertView) {
        _alertView = [[ApprovalAlertView alloc] init];
    }
    return _alertView;
}

- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //_deleteBtn.backgroundColor = [UIColor greenColor];
        [_deleteBtn setImage:[UIImage imageNamed:@"icon-alert-delete"] forState:UIControlStateNormal];
        [_deleteBtn addTarget:self action:@selector(deleteBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_deleteBtn setFrame:CGRectMake(0.82 * App_Width - 50, 0.3 * App_Height - 60, 45, 60)];
    }
    return _deleteBtn;
}

#pragma mark - Action
- (void)deleteBtnPressed:(id)btn {
    
    [_alertView removeFromSuperview];
    _alertView = nil;
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"ApprovalCell";
    ApprovalCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[ApprovalCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([[SettingManager shareManager].managerID isEqualToString:@"0"]) {
        [self.alertView addSubview:self.deleteBtn];
        [UIView animateWithDuration:1.0 animations:^{
            
            [[ConfigFunction xfunc_getAppDelegate].window addSubview:self.alertView];
        }];
    }
    
}
@end

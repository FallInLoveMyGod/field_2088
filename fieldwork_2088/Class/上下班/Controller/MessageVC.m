//
//  MessageVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/15.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "MessageVC.h"

#import "MessageCell.h"

#import "MessageDetailVC.h"

@interface MessageVC () <UITableViewDelegate,UITableViewDataSource>
{
    BOOL _isMessage;
}

@property (nonatomic,strong)UIButton *noticeBtn;

@property (nonatomic,strong)UIButton *messageBtn;

@property (nonatomic,strong)UIView *lineView;

@property (nonatomic,strong)UITableView *mytable;

@end

@implementation MessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.title = @"公告";
}

#pragma mark - UI
- (void)creatUI {
    UIButton *noticeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [noticeBtn setTitle:@"公告" forState:UIControlStateNormal];
    [noticeBtn setTitleColor:Color_Text_Green forState:UIControlStateNormal];
    [noticeBtn setFrame:CGRectMake(App_Width / 4.0 - 18, 13, 36, 18)];
    noticeBtn.titleLabel.font = Font_Medium_14;
    [noticeBtn addTarget:self action:@selector(noticeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.noticeBtn = noticeBtn;
    
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [messageBtn setTitle:@"系统消息" forState:UIControlStateNormal];
    [messageBtn setTitleColor:Color_Text_Black forState:UIControlStateNormal];
    [messageBtn setFrame:CGRectMake(App_Width * 3 / 4.0 - 30, 13, 60, 18    )];
    messageBtn.titleLabel.font = Font_Medium_14;
    [messageBtn addTarget:self action:@selector(messageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.messageBtn = messageBtn;
    
    UIView *bottonLine = [[UIView alloc] initWithFrame:CGRectMake(0, 36, App_Width, 1)];
    bottonLine.backgroundColor = Color_Line;
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 36, App_Width / 2.0, 1)];
    self.lineView.backgroundColor = Color_Text_Green;
    
    [self.view addSubview:self.noticeBtn];
    [self.view addSubview:self.messageBtn];
    [self.view addSubview:bottonLine];
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.mytable];
    
}

- (UITableView *)mytable {
    if (!_mytable) {
        _mytable = [[UITableView alloc] initWithFrame:CGRectMake(0, 38, App_Width, App_Height - 69 - 40) style:UITableViewStyleGrouped];
        _mytable.delegate = self;
        _mytable.dataSource = self;
        _mytable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return _mytable;
}

#pragma mark - Action

- (void)noticeBtnAction:(UIButton *)btn {
    self.title = @"公告";
    if (!_isMessage) {
        return;
    }
    else {
        _isMessage = !_isMessage;
        [self.messageBtn setTitleColor:Color_Text_Black forState:UIControlStateNormal];
        [btn setTitleColor:Color_Text_Green forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{
            self.lineView.frame = CGRectMake(0, 36, App_Width / 2.0, 1);
        }];
    }
}

- (void)messageBtnAction:(UIButton *)btn {
    self.title = @"系统消息";
    if (_isMessage) {
        return;
    }
    else {
        _isMessage = !_isMessage;
        [self.noticeBtn setTitleColor:Color_Text_Black forState:UIControlStateNormal];
        [btn setTitleColor:Color_Text_Green forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{
            self.lineView.frame = CGRectMake(App_Width / 2.0, 36, App_Width / 2.0, 1);
        }];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identify = NSStringFromClass([MessageCell class]);
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageDetailVC *detailVc = [[MessageDetailVC alloc] init];
    [self.navigationController pushViewController:detailVc animated:YES];
}

@end

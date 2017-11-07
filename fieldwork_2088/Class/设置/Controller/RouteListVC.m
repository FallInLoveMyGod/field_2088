//
//  RouteListVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/8/11.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "RouteListVC.h"

#import "RouteListCell.h"

#import "HistoryDetailVC.h"

@interface RouteListVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *mytable;

@property (nonatomic,strong)NSMutableArray *sectionArr;

@property (nonatomic,strong)NSMutableArray *rowArr;


@end

@implementation RouteListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"员工列表";
    
    [self.view addSubview:self.mytable];
    //self.tabBarController.tabBar.hidden = YES;
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //self.tabBarController.tabBar.hidden = NO;
}

#pragma mark -- interface

- (UITableView *)mytable {
    if (!_mytable) {
        _mytable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height - 64) style:UITableViewStyleGrouped];
        _mytable.delegate = self;
        _mytable.dataSource = self;
        _mytable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _mytable;
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"RouteListCell";
    RouteListCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[RouteListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

#pragma mark -- UITableViewDelegate 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 72;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 65;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, App_Width, 65)];
    header.backgroundColor = [UIColor clearColor];
    
    MyCardView *card = [[MyCardView alloc] initWithFrame:CGRectMake(14, 9, App_Width - 28, 55)];
    card.backgroundColor = [UIColor whiteColor];
    
    UILabel *positionLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 220, 20)];
    positionLab.text = @"软件开发部";
    positionLab.textColor = Color_Text_Black;
    positionLab.font = Font_Medium_20;
    [header addSubview:card];
    [card addSubview:positionLab];
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HistoryDetailVC *detailVc = [[HistoryDetailVC alloc] init];
    [self.navigationController pushViewController:detailVc animated:YES];
}
@end

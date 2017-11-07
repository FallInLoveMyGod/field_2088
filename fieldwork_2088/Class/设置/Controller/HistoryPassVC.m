//
//  HistoryPassVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/2.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "HistoryPassVC.h"

#import "HistoryCell.h"

#import "HistoryDetailVC.h"

@interface HistoryPassVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *mytable;

@end

@implementation HistoryPassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mytable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height - 64) style:UITableViewStyleGrouped];
    self.mytable.backgroundColor = Color_UI_Background;
    self.mytable.delegate = self;
    self.mytable.dataSource = self;
    self.mytable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.mytable];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.tintColor = Color_Text_Black;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"HistoryCell";
    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[HistoryCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.block = ^(NSInteger tag) {
        NSLog(@"row == %ld",(long)indexPath.row);
        HistoryDetailVC *detailVC = [[HistoryDetailVC alloc] init];
        [self.navigationController pushViewController:detailVC animated:YES];
    };
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 98;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 8;
}
@end

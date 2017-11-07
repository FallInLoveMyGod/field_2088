//
//  CustomerVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/8.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "CustomerVC.h"

#import "ClassMatesCell.h"

#import "AddMatesVC.h"

@interface CustomerVC () <UITableViewDelegate,UITableViewDataSource>
{
    BOOL _isWorkMates;
}

@property (nonatomic,strong)UIButton *workMatesBtn;

@property (nonatomic,strong)UIButton *customerBtn;

@property (nonatomic,strong)UIView *lineView;

@property (nonatomic,strong)UITableView *mytable;

@end

@implementation CustomerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.type isEqualToString:@"1"]) {
        self.title = @"客户";
    }
    else if ([self.type isEqualToString:@"2"]) {
        self.title = @"同事";
    }
    else {
        self.title = @"员工";
    }
    [self creatUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon-add"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnAction:)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    [self.mytable reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"----------- 77777 --------------");
}

#pragma mark - UI
- (void)creatUI {
    UIButton *workMatesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [workMatesBtn setTitle:@"同事" forState:UIControlStateNormal];
    [workMatesBtn setTitleColor:Color_Text_Green forState:UIControlStateNormal];
    [workMatesBtn setFrame:CGRectMake(0, 0, App_Width / 2.0 , 35)];
    workMatesBtn.titleLabel.font = Font_Medium_14;
    [workMatesBtn addTarget:self action:@selector(workMatesBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.workMatesBtn = workMatesBtn;
    
    UIButton *customerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [customerBtn setTitle:@"客户" forState:UIControlStateNormal];
    [customerBtn setTitleColor:Color_Text_Black forState:UIControlStateNormal];
    [customerBtn setFrame:CGRectMake(App_Width / 2.0, 0, App_Width / 2.0, 35)];
    customerBtn.titleLabel.font = Font_Medium_14;
    [customerBtn addTarget:self action:@selector(customerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.customerBtn = customerBtn;
    
    UIView *bottonLine = [[UIView alloc] initWithFrame:CGRectMake(0, 36, App_Width, 1)];
    bottonLine.backgroundColor = Color_Line;
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 36, App_Width / 2.0, 1)];
    self.lineView.backgroundColor = Color_Text_Green;
    
    [self.view addSubview:customerBtn];
    [self.view addSubview:workMatesBtn];
    [self.view addSubview:bottonLine];
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.mytable ];
    
    _isWorkMates = YES;
}

- (UITableView *)mytable {
    if (!_mytable) {
        _mytable = [[UITableView alloc] initWithFrame:CGRectMake(0, 38, App_Width, App_Height - 69 - 20) style:UITableViewStyleGrouped];
        _mytable.delegate = self;
        _mytable.dataSource = self;
        _mytable.showsVerticalScrollIndicator = NO;
        _mytable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _mytable;
}

#pragma mark - UITableViewDataSource 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"ClassMatesCell";
    ClassMatesCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[ClassMatesCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.nickLab.text = @"魏瑶魏瑶";
    //[cell configDateWhthString:@"魏瑶"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 162;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AddMatesVC *addVC = [[AddMatesVC alloc] init];
    addVC.title = @"修改";
    [self.navigationController pushViewController:addVC animated:YES];
}

#pragma mark - Action
- (void)rightBarBtnAction:(id)btn {
    AddMatesVC *addVC = [[AddMatesVC alloc] init];
    addVC.title = @"增加";
    [self.navigationController pushViewController:addVC animated:YES];
}

- (void)workMatesBtnAction:(UIButton *)btn {
    if (_isWorkMates) {
        return;
    }
    else {
        [btn setTitleColor:Color_Text_Green forState:UIControlStateNormal];
        [self.customerBtn setTitleColor:Color_Text_Black forState:UIControlStateNormal];
        CGRect rect = self.lineView.frame;
        rect.origin.x = 0;
        [UIView animateWithDuration:0.5 animations:^{
            self.lineView.frame = rect;
        }];
        _isWorkMates = !_isWorkMates;
    }
}

- (void)customerBtnAction:(UIButton *)btn {
    if (!_isWorkMates) {
        return;
    }
    else {
        [btn setTitleColor:Color_Text_Green forState:UIControlStateNormal];
        [self.workMatesBtn setTitleColor:Color_Text_Black forState:UIControlStateNormal];
        CGRect rect = self.lineView.frame;
        rect.origin.x = App_Width / 2.0;
        [UIView animateWithDuration:0.5 animations:^{
            self.lineView.frame = rect;
        }];
        _isWorkMates = !_isWorkMates;
    }
}




@end

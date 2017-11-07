//
//  ComparyVertifyVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/2.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "ComparyVertifyVC.h"

#import "VertifyCell.h"

@interface ComparyVertifyVC ()  <UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>

@property (nonatomic,strong)UITableView *mytable;

// 企业认证

@property (nonatomic,strong)UIImageView *vertifyImageV;

@property (nonatomic,strong)UIView *footerOriginView;

@property (nonatomic,strong)UIView *footerOpenView;

@property (nonatomic,strong)UIButton *uploadBtn;

@property (nonatomic,strong)NSMutableArray *topicArr;

@property (nonatomic,strong)UITextField *selectedTF;  // 当前选中的textfield

// 性质认证
@property (nonatomic,strong)UIPickerView *picker;


@end

@implementation ComparyVertifyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    //[self creatNotification];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //self.tabBarController.tabBar.hidden = NO;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)creatNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - UI
- (void)creatUI {
    self.mytable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height - 69) style:UITableViewStyleGrouped];
    self.mytable.delegate = self;
    self.mytable.dataSource = self;
    [self.view addSubview:self.mytable];
    
    self.mytable.tableHeaderView = [self creatTableHeaderView];
    self.mytable.tableFooterView = self.footerOriginView;
}
//  头试图
- (UIView *)creatTableHeaderView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Width * 0.315 + 60 + 20)];
    headerView.backgroundColor = [UIColor clearColor];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 18, App_Width, App_Width * 0.315 + 42 + 20)];
    contentView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0.053 * App_Width, 11, 100, 20)];
    titleLab.text = @"营业执照";
    titleLab.font = Font_14;
    
    self.vertifyImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0.053 * App_Width, 42, 0.51 * App_Width, App_Width * 0.315)];
    self.vertifyImageV.layer.borderWidth = 1;
    self.vertifyImageV.layer.cornerRadius = 4;
    self.vertifyImageV.layer.borderColor = Color_Button_Background.CGColor;
    self.vertifyImageV.clipsToBounds = YES;
    self.vertifyImageV.userInteractionEnabled = YES;
    
    UIButton *upLoadIBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [upLoadIBtn setFrame:CGRectMake(0.255 * App_Width - 14, 0.1575 * App_Width - 14, 28, 28)];
    [upLoadIBtn setImage:[UIImage imageNamed:@"setting-upload"] forState:UIControlStateNormal];
    [upLoadIBtn addTarget:self action:@selector(uploadImage:) forControlEvents:UIControlEventTouchUpInside];
    
    [headerView addSubview:contentView];
    [contentView addSubview:titleLab];
    [contentView addSubview:self.vertifyImageV];
    [self.vertifyImageV addSubview:upLoadIBtn];
    
    return headerView;
}
// 底部视图
- (UIView *)footerOriginView {
    if (!_footerOriginView) {
        _footerOriginView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, App_Width, 76)];
        [self.uploadBtn setFrame:CGRectMake(App_Width/2.0-38, 20, 76, 36)];
        [_footerOriginView addSubview:self.uploadBtn];
        
    }
    return _footerOriginView;
}

- (UIView *)footerOpenView {
    if (!_footerOpenView) {
        _footerOpenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, App_Width, 120)];
        [self.uploadBtn setFrame:CGRectMake(App_Width/2.0-38, 65, 76, 36)];
        [_footerOpenView addSubview:self.uploadBtn];
    }
    return _footerOpenView;
}
// 提交按钮
- (UIButton *)uploadBtn {
    if (!_uploadBtn) {
        _uploadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_uploadBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_uploadBtn setBackgroundColor:Color_Button_Background];
        [_uploadBtn addTarget:self action:@selector(uploadData:) forControlEvents:UIControlEventTouchUpInside];
        
        _uploadBtn.layer.cornerRadius = 20;
        _uploadBtn.clipsToBounds = YES;
    }
    return _uploadBtn;
}

- (UIPickerView *)picker {
    if (!_picker) {
        _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, App_Height - 64 - 165 , App_Width, 165)];
        _picker.backgroundColor = Color_UI_Background;
        _picker.delegate = self;
        _picker.dataSource = self;
    }
    return _picker;
}

- (NSMutableArray *)topicArr {
    if (!_topicArr) {
        _topicArr = [NSMutableArray array];
        [_topicArr addObject:@"企业认证"];
        [_topicArr addObject:@"统一社会信用代码"];
        [_topicArr addObject:@"证照编号"];
        [_topicArr addObject:@"类型"];
        [_topicArr addObject:@"住所"];
        [_topicArr addObject:@"法定代表人"];
        [_topicArr addObject:@"注册资本"];
        [_topicArr addObject:@"营业期限"];
        [_topicArr addObject:@"登记机关"];
        [_topicArr addObject:@"企业电话"];
        [_topicArr addObject:@"经营范围"];
    }
    return _topicArr;
}

#pragma mark - Action
// 上传图片
- (void)uploadImage:(id)btn {
    
}

//  经营范围  公司类型
- (void)chooseBtnAction:(UIButton *)btn  {
    if (btn.tag == 523) {
        if (_picker) {
            _picker.hidden = YES;
            [_picker removeFromSuperview];
            _picker = nil;
        }
        else {
            [self.view addSubview:self.picker];
        }
    }
    else {
        if (_footerOriginView) {
            _footerOriginView = nil;
            self.mytable.tableFooterView = self.footerOpenView;
        }
        else {
            _footerOpenView = nil;
            self.mytable.tableFooterView = self.footerOriginView;
        }
    }
}
//  提交
- (void)uploadData:(id)btn {
   
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identify = [NSString stringWithFormat:@"VertifyCell_index:%ld",indexPath.row] ;
    VertifyCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[VertifyCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleLab.text = self.topicArr[indexPath.row];
    cell.contentTF.delegate = self;
    if (indexPath.row == 10 || indexPath.row == 3) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"setting-more"] forState:UIControlStateNormal];
        btn.tag = 520 + indexPath.row;
        [btn setFrame:CGRectMake(App_Width - 34, 12, 16, 16)];
        [btn addTarget:self action:@selector(chooseBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btn];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 5;
}

#pragma mark - UITableViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"row:%ld",(long)row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 33;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (_picker) {
        _picker.hidden = YES;
        [_picker removeFromSuperview];
        _picker = nil;
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - NSNotification
- (void)keyboardWillShow:(NSNotification *)noti {
    NSDictionary *info = [noti userInfo];
    NSLog(@"%@",info);
    CGRect keyboardRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    //CGFloat y = self.mytable.contentSize.height;
    //self.mytable.contentSize = CGSizeMake(App_Width, y + keyboardRect.size.height) ;
    self.mytable.frame = CGRectMake(0, 0, App_Width, App_Height - 70 - keyboardRect.size.height);
/*
    CGPoint point = [self.selectedTF v:CGPointZero toView:self.view];
    if (App_Height - keyboardRect.size.height >= point.y + 20) {
        return;
    }
    CGFloat offset = point.y - (App_Height - keyboardRect.size.height) + 20 ;
    CGPoint currentOffset = self.mytable.contentOffset;
    self.mytable.contentOffset = CGPointMake(0, currentOffset.y + offset);
    NSLog(@"%f",point.y);
 */
}

- (void)keyboardWillHide:(NSNotification *)noti {
    self.mytable.frame = CGRectMake(0, 0, App_Width, App_Height - 69);
}
@end

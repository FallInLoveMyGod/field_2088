//
//  SettingVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/26.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "SettingVC.h"

#import "SettingCell.h"

#import "ComparyVertifyVC.h"
#import "HistoryPassVC.h"
#import "CustomerVC.h"
#import "RouteListVC.h"
#import "AddMatesVC.h"

@interface SettingVC () <UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong)UITableView *mytable;

@property (nonatomic,strong)NSArray *titleArr;

@property (nonatomic,strong)NSArray *logoImageArr;

@property (nonatomic,strong)NSMutableArray *dataArr;

@property (nonatomic,strong)UIImageView *avatarImageV;

@property (nonatomic,strong)UILabel *nickLab;

@property (nonatomic,strong)UILabel *positionLab;

@property (nonatomic,strong)UILabel *timeLab;

@property (nonatomic,strong)UIImagePickerController *picker;

@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    
}

#pragma mark - UI 
- (void)creatUI {
    
    self.mytable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height) style:UITableViewStyleGrouped];
    self.mytable.delegate = self;
    self.mytable.dataSource = self;
    [self.view addSubview:self.mytable];
    
    self.mytable.tableHeaderView = [self creatTableHeaderView];
        
}
- (UIView *)creatTableHeaderView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, App_Width, 150)];
    headerView.backgroundColor = [UIColor clearColor];
    
    MyCardView *cardView = [[MyCardView alloc] initWithFrame:CGRectMake(0.08 * App_Width, 10, App_Width * 0.84, 130)];
    cardView.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:cardView];
    
    UIImageView *avatarImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0.08 * App_Width, 20, 48, 48)];
    //avatarImageV.backgroundColor = [UIColor cyanColor];
    avatarImageV.image = [UIImage imageNamed:@"icon-avatar-default"];
    self.avatarImageV = avatarImageV;
    
    UILabel *nickLab = [[UILabel alloc] initWithFrame:CGRectMake(0.08 * App_Width + 58, 25, 200, 18)];
    nickLab.text = @"小泽玛丽亚";
    nickLab.font = Font_Medium_14;
    nickLab.textColor = Color_Text_Black;
    self.nickLab = nickLab;
    
    UILabel *positionLab = [[UILabel alloc] initWithFrame:CGRectMake(0.08 * App_Width + 58, 47, 200, 14)];
    positionLab.text = @"腾讯总裁夫人";
    positionLab.font = Font_10;

    positionLab.textColor = Color_Text_Green;
    self.positionLab = positionLab;
    
    UIView *lineV = [[UIView alloc] initWithFrame:CGRectMake(0.08 * App_Width, 76, 0.68 * App_Width, 1)];
    lineV.backgroundColor = Color_Line;
    
    UILabel *timeLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 98, App_Width*0.68-10, 14)];
    timeLab.text = @"入职时间：2017年5月20日";
    timeLab.font = Font_10;
    timeLab.textAlignment = NSTextAlignmentRight;
    self.timeLab = timeLab;
    
    if ([[SettingManager shareManager].managerID isEqualToString:@"0"]) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(modifyInformation:)];
        cardView.userInteractionEnabled = YES;
        [cardView addGestureRecognizer:tap];
    }
    
    UITapGestureRecognizer *avatarTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avatarImagePicker:)];
    self.avatarImageV.userInteractionEnabled = YES;
    [self.avatarImageV addGestureRecognizer:avatarTap];
    
    [cardView addSubview:self.avatarImageV];
    [cardView addSubview:self.nickLab];
    [cardView addSubview:self.positionLab];
    [cardView addSubview:lineV];
    [cardView addSubview:self.timeLab];
    
    return headerView;
}

- (UIImagePickerController *)picker {
    if (!_picker) {
        _picker = [[UIImagePickerController alloc] init];
        _picker.allowsEditing = YES;
        _picker.delegate = self;
    }
    return _picker;
}

- (NSArray *)titleArr {
    if (!_titleArr) {
        if ([[SettingManager shareManager].managerID isEqualToString:@"1"])
              {
            _titleArr = @[@"历史轨迹",@"关于平台",@"更新",@"修改登录密码",@"退出登录"];
        }
        else {
            _titleArr = @[@"企业认证",@"员工管理",@"员工轨迹",@"关于平台",@"更新",@"修改登录密码",@"退出登录"];
        }
        
    }
    return _titleArr;
}

- (NSArray *)logoImageArr {
    if (!_logoImageArr) {
        if ([[SettingManager shareManager].managerID isEqualToString:@"1"]) {
            _logoImageArr = @[@"setting-pass",@"setting-about",@"setting-update",@"setting-resetPwd",@"setting-loginOut"];
        }
        else {
            _logoImageArr = @[@"setting-vertify",@"setting-manager",@"setting-pass",@"setting-about",@"setting-update",@"setting-resetPwd",@"setting-loginOut"];
        }
    }
    return _logoImageArr;
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"SettingCell";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (_dataArr && _dataArr.count != 0) {
        [_dataArr removeAllObjects];
    }
    [self.dataArr addObject:self.logoImageArr[indexPath.row]];
    [self.dataArr addObject:self.titleArr[indexPath.row]];
    [cell configWithDataArr:self.dataArr];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    NSInteger index = indexPath.row;
    if ([[SettingManager shareManager].managerID isEqualToString:@"0"]) {
        switch (index) {
            case 0:
            {
                ComparyVertifyVC *vertifyVC = [[ComparyVertifyVC alloc] init];
                vertifyVC.hidesBottomBarWhenPushed = YES;
                vertifyVC.title = self.titleArr[0];
                [self.navigationController pushViewController:vertifyVC animated:YES];
            }
                break;
                
            case 1:
            {
                CustomerVC *customer = [[CustomerVC alloc] init];
                customer.type = @"3";
                customer.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:customer animated:YES];
            }
                break;
            case 2:
            {
                RouteListVC *route = [[RouteListVC alloc] init];
                route.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:route animated:YES];
            }
                
                break;
            case 3:
            {
                MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:[ConfigFunction xfunc_getAppDelegate].window];
                //hud.label.text = @"密码不正确";
                hud.mode = MBProgressHUDModeCustomView;
                UILabel *lab = [[UILabel alloc] init];
                lab.backgroundColor = [UIColor greenColor];
                lab.text = @"adad";
                hud.customView = lab;
                
                [hud showAnimated:YES];
                [self.view addSubview:hud];
                
                [hud hideAnimated:YES afterDelay:1.5];
            }
                break;
            case 4:
                
                break;
            case 5:
                
                break;
            case 6:
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"11" message:@"22" delegate:nil cancelButtonTitle:@"33" otherButtonTitles: @"44",nil];
                [alert show];
                
            }
                break;
                
            default:
                break;
        }

    }
    else {
        switch (index) {
            case 0:
            {
                HistoryPassVC *historyVC = [[HistoryPassVC alloc] init];
                historyVC.title = self.titleArr[1];
                historyVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:historyVC animated:YES];

            }
                break;
            case 1:
            {
                
            }
                break;
            case 2:
            {
                MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:[ConfigFunction xfunc_getAppDelegate].window];
                //hud.label.text = @"密码不正确";
                hud.mode = MBProgressHUDModeCustomView;
                UILabel *lab = [[UILabel alloc] init];
                lab.backgroundColor = [UIColor greenColor];
                lab.text = @"adad";
                hud.customView = lab;
                
                [hud showAnimated:YES];
                [self.view addSubview:hud];
                
                [hud hideAnimated:YES afterDelay:1.5];
            }
                break;
            case 3:
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"11" message:@"22" delegate:nil cancelButtonTitle:@"33" otherButtonTitles: @"44",nil];
                [alert show];
            }
                break;
     
           
                
            default:
                break;
        }
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerEditedImage];
    self.avatarImageV.image = image;
}

#pragma mark - Handle Action
- (void)modifyInformation:(id)tap {
    AddMatesVC *addVC = [[AddMatesVC alloc] init];
    [self.navigationController pushViewController:addVC animated:YES];
}

- (void)avatarImagePicker:(id)tap {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择图片" message:@"选择添加图片方式" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *useCamera = [UIAlertAction actionWithTitle:@"使用相机拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.picker animated:YES completion:^{
            
        }];

    }];
    
    UIAlertAction *usePhotos = [UIAlertAction actionWithTitle:@"使用相册照片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.picker animated:YES completion:^{
            
        }];

    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:useCamera];
    [alert addAction:usePhotos];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end

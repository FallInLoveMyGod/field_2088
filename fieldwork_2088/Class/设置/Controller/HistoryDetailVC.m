//
//  HistoryDetailVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/14.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "HistoryDetailVC.h"

#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>

@interface HistoryDetailVC () <MAMapViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    BOOL _open;
}

@property (nonatomic,strong)MAMapView *map;

@property (nonatomic,strong)UIButton *rightBarBtn;

@property (nonatomic,strong)UITableView *dateTable;

@property (nonatomic,strong)NSMutableArray *dateArr;

@end

@implementation HistoryDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _open = 1;
    [self creatAlertView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"轨迹详情";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBarBtn];
    [self.view addSubview:self.map];
    [self creatPoly];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //    self.map.showsUserLocation = YES;
    //    self.map.userTrackingMode = MAUserTrackingModeFollow;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_map removeFromSuperview];
    _map = nil;
}

#pragma mark - UI
- (MAMapView *)map {
    if (!_map) {
        _map = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height  - 110)];
        _map.delegate = self;
        _map.zoomLevel = 15;
        CLLocationCoordinate2D commonPolylineCoords;
        commonPolylineCoords.latitude = 39.832136;
        commonPolylineCoords.longitude = 116.34095;
        _map.centerCoordinate = commonPolylineCoords;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapTapAction:)];
        [_map addGestureRecognizer:tap];
    }
    return _map;
}

- (UIButton *)rightBarBtn {
    if (!_rightBarBtn) {
        _rightBarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBarBtn setFrame:CGRectMake(0, 0, 80, 25)];
        _rightBarBtn.titleLabel.font = Font_16;
        _rightBarBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [_rightBarBtn setTitle:@"选择日期" forState:UIControlStateNormal];
        [_rightBarBtn setTitleColor:Color_Button_Background forState:UIControlStateNormal];
        [_rightBarBtn addTarget:self action:@selector(rightBarBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBarBtn;
}

- (UITableView *)dateTable {
    if (!_dateTable) {
        _dateTable = [[UITableView alloc] initWithFrame:CGRectMake(App_Width - 110, 0, 100, 210) style:UITableViewStylePlain];
        _dateTable.delegate = self;
        _dateTable.dataSource = self;
    }
    return _dateTable;
}

- (NSMutableArray *)dateArr {
    if (!_dateArr) {
        _dateArr = [NSMutableArray array];
        [_dateArr addObject:@"星期一"];
        [_dateArr addObject:@"星期二"];
        [_dateArr addObject:@"星期三"];
        [_dateArr addObject:@"星期四"];
        [_dateArr addObject:@"星期五"];
        [_dateArr addObject:@"星期六"];
        [_dateArr addObject:@"星期日"];
    }
    return _dateArr;
}


- (void)creatPoly {
    //构造折线数据
    CLLocationCoordinate2D commonPolylineCoords[4];
    commonPolylineCoords[0].latitude = 39.832136;
    commonPolylineCoords[0].longitude = 116.34095;
    
    commonPolylineCoords[1].latitude = 39.832136;
    commonPolylineCoords[1].longitude = 116.42095;
    
    commonPolylineCoords[2].latitude = 39.902136;
    commonPolylineCoords[2].longitude = 116.42095;
    
    commonPolylineCoords[3].latitude = 39.902136;
    commonPolylineCoords[3].longitude = 116.44095;
    
    //构造折线对象
    ///MAPolyline *commonPolyline = [MAPolyline polylineWithCoordinates:commonPolylineCoords count:commonPolylineCoords];
    
    //在地图上添加折线对象
   // [self.map addOverlay: commonPolyline];
}

- (void)creatAlertView {
    UIView *bottomAlertView = [[UIView alloc] initWithFrame:CGRectMake(0, App_Height - 110 - 44 , App_Width, 100)];
    bottomAlertView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *startImageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 18, 24, 28)];
    startImageV.image = [UIImage imageNamed:@"icon-location-green"];
    
    UILabel *startTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(54, 16, App_Width - 74, 14)];
    startTimeLab.text = @"开始行程 5月10日 12:00";
    startTimeLab.textColor = Color_Text_Gray9;
    startTimeLab.font = Font_10;

    UILabel *startLab = [[UILabel alloc] initWithFrame:CGRectMake(54, 32, App_Width - 74 , 16)];
    startLab.text = @"上海市黄浦区九江路123号";
    startLab.textColor = Color_Text_Black;
    startLab.font = Font_Medium_12;
    
    UIImageView *endImageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 65, 24, 28)];
    endImageV.image = [UIImage imageNamed:@"icon-location-red"];
    
    UILabel *endTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(54, 63, App_Width - 74, 14)];
    endTimeLab.text = @"开始行程 5月10日 12:00";
    endTimeLab.textColor = Color_Text_Gray9;
    endTimeLab.font = Font_10;
    
    UILabel *endLab = [[UILabel alloc] initWithFrame:CGRectMake(54, 79, App_Width - 74 , 16)];
    endLab.text = @"上海市黄浦区九江路123号";
    endLab.textColor = Color_Text_Black;
    endLab.font = Font_Medium_12;

    [self.view addSubview:bottomAlertView];
    [bottomAlertView addSubview:startLab];
    [bottomAlertView addSubview:startTimeLab];
    [bottomAlertView addSubview:startImageV];
    [bottomAlertView addSubview:endLab];
    [bottomAlertView addSubview:endTimeLab];
    [bottomAlertView addSubview:endImageV];
}

#pragma mark - MAMapViewDelegate

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MAPolyline class]])
    {
        MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:overlay];
        
        polylineRenderer.lineWidth    = 8.f;
        polylineRenderer.strokeColor  = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.6];
        polylineRenderer.lineJoinType = kCGLineJoinRound;
        polylineRenderer.lineCapType  = kCGLineCapRound;
        //[polylineRenderer loadStrokeTextureImage:[UIImage imageNamed:@"icon-zd"]];
        return polylineRenderer;
    }
    return nil;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.dateArr[indexPath.row];
    return cell;
}

#pragma mark - Handle Action
- (void)rightBarBtnAction:(UIButton *)btn {
    [self addTableView];
}

- (void)mapTapAction:(id)tap {
    _open = 0;
    [self addTableView];
}

- (void)addTableView {
    _open = !_open;
    if (_open == 0) {
        if (!_dateTable) {
            [self.view addSubview:self.dateTable];
        }
        self.dateTable.hidden = NO;
    }
    else {
        self.dateTable.hidden = YES;
    }
    
}

@end

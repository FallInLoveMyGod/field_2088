//
//  PunchCardVC.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/26.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "PunchCardVC.h"

#define REQUEST_COMMUNITY @"bbs_blog_list"  // 社区首页
#define KDiscoverType1Url @"(http://api.meishi.cc/v5/recipe_news.php?format=json)"

#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>

#import "AlertTimeView.h"

#import "MessageVC.h"

@interface PunchCardVC () <CLLocationManagerDelegate,MAMapViewDelegate>

@property (nonatomic,strong)MAMapView *map;

@property (nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation PunchCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.tabBarItem.title isEqualToString: @"上班"]) {
        NSLog(@"上班");
    }
    else {
        NSLog(@"上班上班上班");
    }
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];

    [self creatUI];
    
    [self requestCommunityData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view addSubview:self.map];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setFrame:CGRectMake(0, 0, 44, 44)];
    [rightBtn setImage:[UIImage imageNamed:@"icon-message"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.map.showsUserLocation = YES;
    self.map.userTrackingMode = MAUserTrackingModeFollow;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_map removeFromSuperview];
    _map = nil;
}


#pragma mark - UI
- (void)creatUI {
    AlertTimeView *alertView = [[AlertTimeView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height)];
    [alertView show];
}
- (MAMapView *)map {
    if (!_map) {
        _map = [[MAMapView alloc] initWithFrame:CGRectMake(20, 0, App_Width - 40, App_Height )];
        CLLocation *location = [[NSUserDefaults standardUserDefaults] objectForKey:@"location"];
        _map.centerCoordinate = location.coordinate;
        _map.zoomLevel = 15;
        _map.delegate = self;
    }
    return _map;
}

#pragma mark - Action 
- (void)rightBarButtonAction:(id)action {
    if ([self respondsToSelector:@selector(rightBarButtonAction:)]) {
        MessageVC *message = [[MessageVC alloc] init];
        message.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:message animated:YES];
    }
}
// 自定义定位小蓝点
- (void)creatUserLocationRepresentation {
    MAUserLocationRepresentation *r = [[MAUserLocationRepresentation alloc] init];
    r.showsAccuracyRing = NO;///精度圈是否显示，默认YES
    r.showsHeadingIndicator = NO;///是否显示方向指示(MAUserTrackingModeFollowWithHeading模式开启)。默认为YES
    r.fillColor = [UIColor redColor];///精度圈 填充颜色, 默认 kAccuracyCircleDefaultColor
    r.strokeColor = [UIColor blueColor];///精度圈 边线颜色, 默认 kAccuracyCircleDefaultColor
    r.lineWidth = 2;///精度圈 边线宽度，默认0
    r.enablePulseAnnimation = NO;///内部蓝色圆点是否使用律动效果, 默认YES
    r.locationDotFillColor = [UIColor grayColor];///定位点蓝色圆点颜色，不设置默认蓝色
    r.image = [UIImage imageNamed:@"你的图片"]; ///定位图标, 与蓝色原点互斥
    [_map updateUserLocationRepresentation:r];
}

- (void)creatPoly {
    //构造折线数据对象
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
    MAPolyline *commonPolyline = [MAPolyline polylineWithCoordinates:commonPolylineCoords count:4];
    
    //在地图上添加折线对象
    [_map addOverlay: commonPolyline];
}
#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", locations[0].coordinate.latitude, locations[0].coordinate.longitude, locations[0].horizontalAccuracy);
    self.map.centerCoordinate = locations[0].coordinate;
    [manager stopUpdatingLocation];
//    if (locations.count != 0) {
//        [[NSUserDefaults standardUserDefaults] setObject:locations[0] forKey:@"location"];
//    }
    
}

#pragma mark - 服务器
- (void)requestCommunityData {
    NSDictionary *pardic = @{@"lat":@" ",@"lon":@"121.2839128025973",@"id":@"202158",@"vk":@"a9a104e0051deb260ce9c069bd5f363d"};
    [RequestFunction requestPostWithUrl:KDiscoverType1Url target:self selector:@selector(responseCommunityWithInfo:) parameter:pardic];
}
- (void)responseCommunityWithInfo:(NSDictionary *)info {
    NSLog( @"%@",info);
}


@end

//
//  LocationViewController.m
//  22_LocationDemo
//
//  Created by hongbo ni on 2019/6/13.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(60, 60, 100, 50)];
    [button setTitle:@"locate" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(locate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [self locate];
    
    // add a button to show the locate result
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(60, 120, 100, 50)];
    [button1 setTitle:@"show locate" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor blackColor]];
    [button1 addTarget:self action:@selector(showLocate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}


-(void)showLocate{
    NSString *result = [[NSString alloc] initWithFormat:@"address:%@\n latitude:%@\n longitude:%@",self.address, self.latitude, self.longitude];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"locate result" message:result preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
    }];
    [alert addAction:action];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}


- (void)locate {
    if ([CLLocationManager locationServicesEnabled]) {//监测权限设置
        NSLog(@"locate begin...");
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;//设置代理
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;//设置精度
        self.locationManager.distanceFilter = 1000.0f;//距离过滤
        [self.locationManager requestAlwaysAuthorization];//位置权限申请
        [self.locationManager startUpdatingLocation];//开始定位
    }
}

#pragma mark location代理
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"locate didFailWithError...");
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您还未开启定位服务，是否需要开启？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    UIAlertAction *queren = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL *setingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication]openURL:setingsURL];
    }];
    [alert addAction:cancel];
    [alert addAction:queren];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"locate didUpdateLocations...");
    
    
    [self.locationManager stopUpdatingLocation];//停止定位
    //地理反编码
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    //当系统设置为其他语言时，可利用此方法获得中文地理名称
    NSMutableArray
    *userDefaultLanguages = [[NSUserDefaults standardUserDefaults]objectForKey:@"AppleLanguages"];
    // 强制 成 简体中文
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-hans", nil]forKey:@"AppleLanguages"];
    
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks[0];
            NSLog(@"##### placeMark is %@", placeMark);
            NSString *name = placeMark.name;
            NSLog(@" name is %@", name);
            NSDictionary *addr = placeMark.addressDictionary;
            NSLog(@" addr is %@", addr);
            NSString *wholeAddress = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@%@",
                                      placeMark.country,
                                      placeMark.administrativeArea,
                                      ((placeMark.subAdministrativeArea == nil)?@"":placeMark.subAdministrativeArea),
                                      placeMark.locality,
                                     ((placeMark.subLocality == nil)?@"":placeMark.subLocality),
                                      placeMark.thoroughfare,
                                      ((placeMark.subThoroughfare == nil)?@"":placeMark.subThoroughfare)];
            NSLog(@"whole address is %@",wholeAddress);
            
            //获取经纬度
            double latitude = placeMark.location.coordinate.latitude;
            double longitude = placeMark.location.coordinate.longitude;
            
            self.address = wholeAddress;
            self.latitude = [[NSString alloc] initWithFormat:@"%f", latitude];
            self.longitude = [[NSString alloc] initWithFormat:@"%f", longitude];
            NSLog(@" latitude is %@", self.latitude);
            NSLog(@" longitude is %@", self.longitude);
            
            
            NSString *city = placeMark.locality;
            if (!city) {
                self.currentCity = @"⟳定位获取失败,点击重试";
                // TODO: 有可能是直辖市，需要获取 administrativeArea 字段
            } else {
                self.currentCity = placeMark.locality ;//获取当前城市
                
            }
            
        } else if (error == nil && placemarks.count == 0 ) {
            
        } else if (error) {
            self.currentCity = @"⟳定位获取失败,点击重试";
        }
        // 还原Device 的语言
        [[NSUserDefaults
          standardUserDefaults] setObject:userDefaultLanguages
         forKey:@"AppleLanguages"];
    }];
    
    NSLog(@"locate self.currentCity is %@", self.currentCity);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

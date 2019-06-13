//
//  LocationViewController.h
//  22_LocationDemo
//
//  Created by hongbo ni on 2019/6/13.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocationViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;//设置manager
@property (nonatomic, strong) NSString *currentCity;

//定位地址全称
@property (nonatomic, strong) NSString *address;
//纬度
@property (nonatomic, strong) NSString *latitude;
//经度
@property (nonatomic, strong) NSString *longitude;



@end

NS_ASSUME_NONNULL_END

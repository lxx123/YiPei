//
//  ELCityOrientation.h
//  ELIFE
//
//  Created by lixiao on 13-4-24.
//  Copyright (c) 2013年 lixiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@class ELCityOrientation;
@protocol ELCityOrientationDelegate <NSObject>

/**
 *定位城市获取数据完成
 */
- (void)CityOrientationDataDidFinish:(ELCityOrientation *)engine CityName:(NSString *)cityname;

/**
 *定位城市失败
 */
- (void)CityOrientationError:(ELCityOrientation *)engine  Error:(NSString *)error;

@end


@interface ELCityOrientation : NSObject<CLLocationManagerDelegate>
@property(nonatomic,strong)CLLocationManager *locManager;
@property(nonatomic,weak)id<ELCityOrientationDelegate>delegate;
@property(nonatomic,strong)NSString *eCityName;
@property(nonatomic)BOOL eIsCity;


//启动定位
-(void)UpdatingLocation;



@end

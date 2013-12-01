//
//  ELCityOrientation.m
//  ELIFE
//
//  Created by lixiao on 13-4-24.
//  Copyright (c) 2013年 lixiao. All rights reserved.
//

#import "ELCityOrientation.h"

@implementation ELCityOrientation
@synthesize locManager=_locManager;
@synthesize delegate=_delegate;
@synthesize eCityName=_eCityName;
@synthesize eIsCity=_eIsCity;

//启动定位
-(void)UpdatingLocation{
    _eIsCity=NO;
    //初始化位置管理器
    _locManager = [[CLLocationManager alloc]init];
    //设置代理
    _locManager.delegate = self;
    //设置位置经度
    _locManager.desiredAccuracy = kCLLocationAccuracyBest;
    //设置每隔100米更新位置
    _locManager.distanceFilter = 100;
    //开始定位服务
    [_locManager startUpdatingLocation];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//协议中的方法，作用是每当位置发生更新时会调用的委托方法
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //结构体，存储位置坐标
//    CLLocationCoordinate2D loc = [newLocation coordinate];
//    float longitude = loc.longitude;
//    float latitude = loc.latitude;
//    self.lonLabel.text = [NSString stringWithFormat:@"%f",longitude];
//    self.latLabel.text = [NSString stringWithFormat:@"%f",latitude];
    
    CLGeocoder* geocoder = [[CLGeocoder alloc] init];
    
    [geocoder reverseGeocodeLocation:newLocation completionHandler:
     
     ^(NSArray* placemarks, NSError* error){
         
         NSLog(@"%@",placemarks);
         if (error == nil &&
             [placemarks count] > 0){
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             NSLog(@"Country = %@", placemark.country);
             NSLog(@"Postal Code = %@", placemark.postalCode);
             NSLog(@"Locality = %@", placemark.locality);
             _eCityName=placemark.locality;
             if (!_eIsCity) {
                 if ([_delegate respondsToSelector:@selector(CityOrientationDataDidFinish: CityName:)]) {
                     [_delegate CityOrientationDataDidFinish:self CityName:_eCityName];
                 }
                 _eIsCity=YES;
             }
             
         }
         else if (error == nil &&
                  [placemarks count] == 0){
             NSLog(@"No results were returned.");
         }
         else if (error != nil){
             NSLog(@"An error occurred = %@", error);
         }
     }];
    
    //[_locManager stopUpdatingLocation];
}

//当位置获取或更新失败会调用的方法
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString *errorMsg = nil;
    if ([error code] == kCLErrorDenied) {
        errorMsg = @"访问被拒绝";
    }
    if ([error code] == kCLErrorLocationUnknown) {
        errorMsg = @"获取位置信息失败";
    }
    
    if ([_delegate respondsToSelector:@selector(CityOrientationError: Error:)]) {
        [_delegate CityOrientationError:self Error:errorMsg];
    }
}
















@end

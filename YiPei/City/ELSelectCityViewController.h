//
//  ELSelectCityViewController.h
//  ELIFE
//
//  Created by lixiao on 13-4-23.
//  Copyright (c) 2013年 lixiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataProcessProtocol.h"

#import "ELCityOrientation.h"
@class citySiteFunc;

@interface ELSelectCityViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,dataCitySiteProcessProtocol,ELCityOrientationDelegate>
@property(nonatomic,strong)UITableView *eCitytab;//城市列表
@property(nonatomic,strong)citySiteFunc *eCityList;//城市列表数据
@property(nonatomic,strong)NSMutableArray *eCityitemarray;
//@property(nonatomic,strong)NSMutableArray *eCityletter;//城市名字首字母
@property(nonatomic,strong)ELCityOrientation *eCityOrientation;//城市定位
@property(nonatomic,strong)NSString *eCityPinyin;
//网络链接成功
-(void)hxzLoadHomeNetData;
//网络链接失败
-(void)hxzCloseFirstViewCallback;
//2g/3g网络提醒
-(void)hxzChkNetViaWWAN;
//无线网络提醒
-(void)hxzChkNetViaWiFi;

-(void)leftBarBtnPress;
-(NSInteger)sectionNum:(NSInteger)section Row:(NSInteger)row;
-(void )cityitem:(NSString *)letter;


@end

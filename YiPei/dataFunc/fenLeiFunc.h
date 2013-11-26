//
//  fenLeiFunc.h
//  YiPei
//
//  Created by lee on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "dataProcessProtocol.h"

@interface fenLeiFunc : NSObject
{
    id<dataLoadCarInfoByPidProcessProtocol>delegateCarInfoByPid;
    id<dataLoadCarInfoByLevelProcessProtocol>delegateCarInfoByLevel;
    id<dataGoodsCategoryByPidProcessProtocol>delegateGoodsCateByPid;
    id<dataGoodsAllBrandProcessProtocol>delegateGoodsAllBrand;
    id<dataGoodsListProcessProtocol>delegateGoodsList;
    id<dataFilterAttrByCateProcessProtocol>delegateFilterAtrrByCate;
    id<dataGoodsCarModelByCateProcessProtocol>delegateGoodsCarByCate;
    id<dataGoodsCategoryByBrandProcessProtocol>delegateGoodsCateByBrand;
}

@property(nonatomic ,retain) id delegateCarInfoByPid;
@property(nonatomic ,retain) id delegateCarInfoByLevel;

@property(nonatomic ,retain) id delegateGoodsCateByPid;
@property(nonatomic ,retain) id delegateGoodsAllBrand;

@property(nonatomic ,retain) id delegateGoodsList;
@property(nonatomic ,retain) id delegateFilterAtrrByCate;

@property(nonatomic ,retain) id delegateGoodsCarByCate;
@property(nonatomic ,retain) id delegateGoodsCateByBrand;

- (void)getCarInfoByPid:(NSString *)pid;
- (void)getCarInfoByLevel:(NSString *)level;//level  车型数据等级（1：品牌2：车系3：排量4：年款）
- (void)getGoodsCateByPid:(NSString *)pid;
- (void)getGoodsAllBrand:(NSString *)firstLetter sortBy:(NSString *)sort;//是否按照首字母排序升序排列（0：否1：是）
- (void)getGoodsAllBrand:(NSString *)firstLetter;

- (NSArray *)getGoodsSubCateByPId:(NSString *)pid;

@end

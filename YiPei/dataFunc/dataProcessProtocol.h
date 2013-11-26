//
//  dataProcessProtocol.h
//  YiPei
//
//  Created by lee on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol dataProcessProtocol <NSObject>
@required
- (void) didTodayMarketDataSuccess : (NSString *)data;
- (void) didTodayMarketDataFailed : (NSString *)err;
@end

@protocol dataTodayDiscountProcessProtocol <NSObject>
@required
- (void) didTodayDiscountDataSuccess : (NSString *)data;
- (void) didTodayDiscountDataFailed : (NSString *)err;
@end

@protocol dataGoodsInfoProcessProtocol <NSObject>
@required
- (void) didGoodsInfoDataSuccess : (NSString *)data;
- (void) didGoodsInfoDataFailed : (NSString *)err;

@end

//@protocol dataGoodsInfoProcessProtocol <NSObject>
//@required
//- (void) didGoodsInfoDataSuccess : (NSString *)data;
//- (void) didGoodsInfoDataFailed : (NSString *)err;
//
//@end

@protocol dataUploadImagedProcessProtocol <NSObject>
@required
- (void) didUploadImageDataSuccess : (NSString *)data;
- (void) didUploadImageDataFailed : (NSString *)err;

@end

@protocol dataLowPriceNotifyProcessProtocol <NSObject>
@required
- (void) didLowPriceNotifyDataSuccess : (NSString *)data;
- (void) didLowPriceNotifyDataFailed : (NSString *)err;
@end

@protocol dataLoadCarInfoByPidProcessProtocol <NSObject>
@required
- (void) didLoadCarInfoByPidDataSuccess : (NSString *)data;
- (void) didLoadCarInfoByPidDataFailed : (NSString *)err;

@end


@protocol dataLoadCarInfoByLevelProcessProtocol <NSObject>
@required
- (void) didLoadCarInfoByLevelDataSuccess : (NSString *)data;
- (void) didLoadCarInfoByLevelDataFailed : (NSString *)err;

@end

@protocol dataGoodsCategoryByPidProcessProtocol <NSObject>
@required
- (void) didGoodsCategoryByPidDataSuccess : (NSString *)data;
- (void) didGoodsCategoryByPidDataFailed : (NSString *)err;

@end

@protocol dataGoodsAllBrandProcessProtocol <NSObject>
@required
- (void) didGoodsAllBrandDataSuccess : (NSString *)data;
- (void) didGoodsAllBrandDataFailed : (NSString *)err;

@end

@protocol dataGoodsListProcessProtocol <NSObject>
@required
- (void) didGoodsListDataSuccess : (NSString *)data;
- (void) didGoodsListDataFailed : (NSString *)err;

@end

@protocol dataFilterAttrByCateProcessProtocol <NSObject>
@required
- (void) didFilterAttrByCateDataSuccess : (NSString *)data;
- (void) didFilterAttrByCateDataFailed : (NSString *)err;

@end

@protocol dataGoodsCarModelByCateProcessProtocol <NSObject>
@required
- (void) didGoodsCarModelByCateDataSuccess : (NSString *)data;
- (void) didGoodsCarModelByCateatDaFailed : (NSString *)err;

@end

@protocol dataGoodsCategoryByBrandProcessProtocol <NSObject>
@required
- (void) didGoodsCategoryByBrandDataSuccess : (NSString *)data;
- (void) didGoodsCategoryByBrandDataFailed : (NSString *)err;

@end

@protocol dataGoodsBrandByCarModelProcessProtocol <NSObject>
@required
- (void) didGoodsBrandByCarModelDataSuccess : (NSString *)data;
- (void) didGoodsBrandByCarModelDataFailed : (NSString *)err;

@end

@protocol dataGoodsCategoryByCarModelProcessProtocol <NSObject>
@required
- (void) didGoodsCategoryByCarModelDataSuccess : (NSString *)data;
- (void) didGoodsCategoryByCarModelDataFailed : (NSString *)err;

@end

@protocol dataSearchGoodsProcessProtocol <NSObject>
@required
- (void) didSearchGoodsDataSuccess : (NSString *)data;
- (void) didSearchGoodsDataFailed : (NSString *)err;

@end

@protocol dataSearchGoodsByBarCodeProcessProtocol <NSObject>
@required
- (void) didSearchGoodsByBarCodeDataSuccess : (NSString *)data;
- (void) didSearchGoodsByBarCodeDataFailed : (NSString *)err;

@end

@protocol dataSearchGoodsByVinCodeProcessProtocol <NSObject>
@required
- (void) didSearchGoodsByVinCodeDataSuccess : (NSString *)data;
- (void) didSearchGoodsByVinCodeDataFailed : (NSString *)err;

@end

@protocol dataMyOrderListsProcessProtocol <NSObject>
@required
- (void) didMyOrderListsDataSuccess : (NSString *)data;
- (void) didMyOrderListsDataFailed : (NSString *)err;

@end

@protocol dataProfileProcessProtocol <NSObject>
@required
- (void) didProfileDataSuccess : (NSString *)data;
- (void) didProfileDataFailed : (NSString *)err;

@end

@protocol dataProfileIndexProcessProtocol <NSObject>
@required
- (void) didProfileIndexDataSuccess : (NSString *)data;
- (void) didProfileIndexDataFailed : (NSString *)err;

@end




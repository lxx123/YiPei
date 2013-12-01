//
//  searchFunc.h
//  YiPei
//
//  Created by lee on 13-11-28.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProcessProtocol.h"
#import "NetCommand.h"


@interface searchFunc : NetCommand
{
    id<dataSearchGoodsProcessProtocol>delegateSearchGoods;
    id<dataSearchGoodsByBarCodeProcessProtocol>delegateBarcode;
    id<dataSearchGoodsByVinCodeProcessProtocol>delegateVincode;
}

@property(nonatomic ,retain) id delegateSearchGoods;
@property(nonatomic ,retain) id delegateBarcode;

@property(nonatomic ,retain) id delegateVincode;

- (void)getSearchGood:(NSString *)keyword;
- (void)getSearchBarcode:(NSString *)barCode;
- (void)getSearchVincode:(NSString *)vinCode;
@end

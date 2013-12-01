//
//  lowPriceFunc.h
//  YiPei
//
//  Created by lee on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProcessProtocol.h"

@interface lowPriceFunc : NSObject
{
    id<dataLowPriceNotifyProcessProtocol>delegateLowPrice;
    id<dataUploadImagedProcessProtocol>delegateUpload;
}

@property(nonatomic, retain)id delegateLowPrice;
@property(nonatomic, retain)id delegateUpload;

- (void)getUploadImage:(NSString *)goodsSn;

//调用该接口之前必须验证UID是否是空，空则提示验证
- (void)getLowPriceNotify:(NSString *)goodID SysPrice:(NSString *)sys Price:(NSString *)p Number:(NSString *)num Rebates:(NSString *)bates Imageurl:(NSString *)url;

@end

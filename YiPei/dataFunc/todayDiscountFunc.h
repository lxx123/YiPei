//
//  todayDiscountFunc.h
//  YiPei
//
//  Created by lee on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProcessProtocol.h"

#import "NetCommand.h"

@interface todayDiscountommand : NetCommand
{
    id data_base;
    id data_extension;
}
@property(nonatomic, retain)id data_base;
@property(nonatomic, retain)id data_extension;
@end


@interface todayDiscountFunc : NSObject
{
    id<dataTodayDiscountProcessProtocol> delegate;
}

@property(nonatomic, retain)id delegate;

- (void)getTodayDiscount:(NSString *)index sortPrice:(NSString *)sortP sortSale:(NSString *)sortS;

@end

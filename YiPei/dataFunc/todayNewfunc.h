//
//  todayMarketfunc.h
//  YiPei
//
//  Created by lee on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProcessProtocol.h"

@interface todayNewfunc : NSObject
{
    id<dataTodayNewProcessProtocol> delegate;
}

@property(nonatomic, retain)id delegate;

- (void)getTodayNew:(NSString *)index City:(NSString *)cID SortPrice:(NSString *)sortp SortSale:(NSString *)sortS;

@end

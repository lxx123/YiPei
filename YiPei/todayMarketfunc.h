//
//  todayMarketfunc.h
//  YiPei
//
//  Created by lee on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProcessProtocol.h"

@interface todayMarketfunc : NSObject
{
    id<dataProcessProtocol> delegate;
}

@property(nonatomic, retain)id delegate;

- (void)getTodayMarket:(NSString *)index;

@end

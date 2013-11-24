//
//  shouYeViewController.h
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataProcessProtocol.h"

@class todayMarketfunc;
@interface shouYeViewController : UIViewController<dataProcessProtocol>
{
    todayMarketfunc *todayMarket;
}
@property(nonatomic, retain) todayMarketfunc *todayMarket;
@end

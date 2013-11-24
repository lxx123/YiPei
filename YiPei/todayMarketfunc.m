//
//  todayMarketfunc.m
//  YiPei
//
//  Created by lee on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "todayMarketfunc.h"
#import "model.h"
#import "dataProcessProtocol.h"

@implementation todayMarketfunc
@synthesize delegate;

//@synthesize callback=_callback;

- (void)getTodayMarket:(NSString *)index;
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"todayMarket" forKey:@"a"];
    [command.paramDict setObject:index forKey:@"index"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"_todayMarketCmd success!");
        homeTodayMarket *htm = (homeTodayMarket *)command.data;
        NSLog(@"htm=%@",htm);
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didDataSuccess:)]) {
            [self.delegate performSelector:@selector(didDataSuccess:) withObject:htm];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"_todayMarketCmd err!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didDataFailed:)]) {
            [self.delegate performSelector:@selector(didDataFailed:) withObject:command.errorMsg];
        }
    }
}

@end

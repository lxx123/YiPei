  //
//  citySiteFunc.m
//  YiPei
//
//  Created by lee on 13-11-29.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "citySiteFunc.h"

@implementation citySiteFunc
@synthesize delegate;

-(void) getCitySite
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"getCitySite" forKey:@"a"];
    
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getCitySite success!");
        NSArray *citys= (NSArray *)command.data;
        NSLog(@"citys=%@",citys);
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didCitySiteDataSuccess:)]) {
            [self.delegate performSelector:@selector(didCitySiteDataSuccess:) withObject:citys];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getCitySite err!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didCitySiteDataFailed:)]) {
            [self.delegate performSelector:@selector(didCitySiteDataFailed:) withObject:command.errorMsg];
        }
    }
}
@end

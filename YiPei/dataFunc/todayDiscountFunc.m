//
//  todayDiscountFunc.m
//  YiPei
//
//  Created by lee on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "todayDiscountFunc.h"
#import "NetCommand.h"
#import "model.h"
#import "NetConfig.h"
#import "JSONKit.h"

@implementation todayDiscountommand
@synthesize data_base;
@synthesize data_extension;
- (void)execute {
	NSMutableString *reqUrl = [NSMutableString string];
	[reqUrl appendString:[[NetConfig sharedNetConfig] getDomainDesc]];
	if ([paramDict count] > 0) {
		NSArray *allkeys = [paramDict allKeys];
        
        [reqUrl appendString:@"?"];
        
        [reqUrl appendString:@"m"];
        [reqUrl appendString:@"="];
        [reqUrl appendString:[paramDict valueForKey:@"m"]];
        
        [reqUrl appendString:@"&"];
        
        [reqUrl appendString:@"a"];
        [reqUrl appendString:@"="];
        [reqUrl appendString:[paramDict valueForKey:@"a"]];
        
        for (NSString *key in allkeys) {
            if (![key isEqualToString:@"m"] && ![key isEqualToString:@"m"]) {
                [reqUrl appendString:@"&"];
                [reqUrl appendString:key];
                [reqUrl appendString:@"="];
                [reqUrl appendString:[paramDict valueForKey:key]];
            }
            
        }
        
    }
    NSLog(@"reqUrl = %@", reqUrl);
    
	NSURL *url = [[NSURL alloc] initWithString:reqUrl];
    
	NSData *jsonData = [NSData dataWithContentsOfURL:url];
    
    
	@try {
        NSMutableDictionary *dictionary=[jsonData objectFromJSONData];
        
        self.errorCode = [[dictionary objectForKey:@"errorCode"]intValue];
        self.errorMsg = [dictionary objectForKey:@"errorMsg"];
        self.data_base = [dictionary objectForKey:@"data"];
        self.data_extension = [dictionary objectForKey:@"todayNews"];
	}
	@catch (NSException * e) {
		NSLog(@"execute,error=%@",e);
	}
	@finally {
		
	}
	
}
@end

@implementation todayDiscountFunc
@synthesize delegate;
- (void)getTodayDiscount:(NSString *)cID Index:(NSString *)index sortPrice:(NSString *)sortP sortSale:(NSString *)sortS
{
    todayDiscountommand *command = [[todayDiscountommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"todayDiscountGoods" forKey:@"a"];
    [command.paramDict setObject:cID forKey:@"city"];
    [command.paramDict setObject:index forKey:@"index"];
    [command.paramDict setObject:sortP forKey:@"sortPrice"];
    [command.paramDict setObject:sortS forKey:@"sortSale"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getTodayDiscount success!");
        NSArray *goods = (NSArray *)command.data_base;
        todayNew *new = (todayNew *)command.data_extension;
        NSLog(@"goods=%@",goods);
        NSLog(@"new=%@",new);
        NSArray *tmp = [[NSArray alloc]initWithObjects:goods,new, nil];
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didTodayDiscountDataSuccess:)]) {
            [self.delegate performSelector:@selector(didTodayDiscountDataSuccess:) withObject:tmp];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getTodayDiscount err!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didTodayDiscountDataFailed:)]) {
            [self.delegate performSelector:@selector(didTodayDiscountDataFailed:) withObject:command.errorMsg];
        }
    }

}
@end

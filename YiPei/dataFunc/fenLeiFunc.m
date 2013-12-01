//
//  fenLeiFunc.m
//  YiPei
//
//  Created by lee on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import "NetCommand.h"
#import "fenLeiFunc.h"

@implementation fenLeiFunc
@synthesize delegateCarInfoByPid;
@synthesize delegateCarInfoByLevel;

@synthesize delegateGoodsCateByPid;
@synthesize delegateGoodsAllBrand;

@synthesize delegateGoodsList;
@synthesize delegateFilterAtrrByCate;

@synthesize delegateGoodsCarByCate;
@synthesize delegateGoodsCateByBrand;

- (void)getGoodsCateByPid:(NSString *)pid
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getGoodsCategoryByPid" forKey:@"a"];
    [command.paramDict setObject:pid forKey:@"pid"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsCateByPid success!");
        NSArray *goodsCate = (NSArray *)command.data;
        NSLog(@"goodsCate=%@",goodsCate);
        if (self.delegateGoodsCateByPid &&[self.delegateGoodsCateByPid respondsToSelector:@selector(didGoodsCategoryByPidDataSuccess:)]) {
            [self.delegateGoodsCateByPid performSelector:@selector(didGoodsCategoryByPidDataSuccess:) withObject:goodsCate];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        if (self.delegateGoodsCateByPid &&[self.delegateGoodsCateByPid respondsToSelector:@selector(didGoodsCategoryByPidDataFailed:)]) {
            [self.delegateGoodsCateByPid performSelector:@selector(didGoodsCategoryByPidDataFailed:) withObject:command.errorMsg];
        }
    }
 
}

- (NSArray *)getGoodsSubCateByPId:(NSString *)pid
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getGoodsCategoryByPid" forKey:@"a"];
    [command.paramDict setObject:pid forKey:@"pid"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsSubCateByPId success!");
        NSArray *goodsCate = (NSArray *)command.data;
        NSLog(@"goodsCate=%@",goodsCate);
        return goodsCate;
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        return nil;
    }
    return nil;
}

@end

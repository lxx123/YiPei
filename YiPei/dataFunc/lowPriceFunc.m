//
//  lowPriceFunc.m
//  YiPei
//
//  Created by lee on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "lowPriceFunc.h"
#import "model.h"

@implementation lowPriceFunc

@synthesize delegateLowPrice;
@synthesize delegateUpload;

- (void)getUploadImage:(NSString *)goodsSn
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"uploadImage" forKey:@"a"];
    [command.paramDict setObject:goodsSn forKey:@"index"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getUploadImage success!");
        uploadImageInfo *info = (uploadImageInfo *)command.data;
        NSLog(@"info=%@",info);
        if (self.delegateUpload &&[self.delegateUpload respondsToSelector:@selector(didUploadImageDataSuccess:)]) {
            [self.delegateUpload performSelector:@selector(didUploadImageDataSuccess:) withObject:info];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getUploadImage err!");
        if (self.delegateUpload &&[self.delegateUpload respondsToSelector:@selector(didUploadImageDataFailed:)]) {
            [self.delegateUpload performSelector:@selector(didUploadImageDataFailed:) withObject:command.errorMsg];
        }
    }
}

- (void)getLowPriceNotify:(NSString *)goodID SysPrice:(NSString *)sys Price:(NSString *)p Number:(NSString *)num Rebates:(NSString *)bates Imageurl:(NSString *)url
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"lowPriceNotify" forKey:@"a"];
    [command.paramDict setObject:goodID forKey:@"goodsId"];
    [command.paramDict setObject:goodID forKey:@"sysPrice"];//10进制 小数点后两位
    [command.paramDict setObject:goodID forKey:@"price"];//10进制 小数点后两位
    [command.paramDict setObject:goodID forKey:@"number"];
    [command.paramDict setObject:goodID forKey:@"rebates"];//10进制 小数点后两位
    [command.paramDict setObject:goodID forKey:@"imgUrl"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getLowPriceNotify success!");
        //data    如果失败，返回空，否则新增降价通知记录自增id
        if (self.delegateLowPrice &&[self.delegateLowPrice respondsToSelector:@selector(didLowPriceNotifyDataSuccess:)]) {
            [self.delegateLowPrice performSelector:@selector(didLowPriceNotifyDataSuccess:) withObject:command.data];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getLowPriceNotify err!");
        if (self.delegateLowPrice &&[self.delegateLowPrice respondsToSelector:@selector(didLowPriceNotifyDataFailed:)]) {
            [self.delegateLowPrice performSelector:@selector(didLowPriceNotifyDataFailed:) withObject:command.errorMsg];
        }
    }
}
@end

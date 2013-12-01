//
//  userDataManager.m
//  YiPei
//
//  Created by lee on 13-11-30.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "userDataManager.h"

@implementation userDataManager
@synthesize uID;
@synthesize cityName;
@synthesize cityID;
@synthesize myCart;
@synthesize myBuy;
@synthesize myName;

static userDataManager *user;

+(userDataManager*)sharedUserDataManager{
    
    @synchronized(self)
    {
        if (user == nil)
        {
            user = [[self alloc] init];
        }
    }
    return user;
}

+(id) allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (user == nil)
        {
            user = [super allocWithZone:zone];
            return user;
        }
    }
    return nil;
}
@end

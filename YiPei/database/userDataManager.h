//
//  userDataManager.h
//  YiPei
//
//  Created by lee on 13-11-30.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userDataManager : NSObject
{
    NSString *uID;
    NSString *cityName;
    NSString *cityID;
    NSArray *myCart;
    NSArray *myBuy;
    NSString *myName;
}
@property(nonatomic, retain) NSString *uID;
@property(nonatomic, retain) NSString *cityName;
@property(nonatomic, retain) NSString *cityID;
@property(nonatomic, retain) NSArray *myCart;
@property(nonatomic, retain) NSArray *myBuy;
@property(nonatomic, retain) NSString *myName;

+(userDataManager*)sharedUserDataManager;

@end

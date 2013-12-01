//
//  userInfo.h
//  YiPei
//
//  Created by lee on 13-11-29.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionDatabase.h"
@class citySite;

@interface userInfo : ConnectionDatabase
 {
	NSMutableArray *groups;
	BOOL isInsert;
}
@property(nonatomic,retain) NSMutableArray *groups;


-(void)creatDatabase;

- (citySite *)getCityInfo;
-(void)addCityInfo:(NSString *)cID cityName:(NSString *)cName;
@end

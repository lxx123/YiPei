//
//  ConnectionDatabase.h
//  TableView
//
//  Created by du jianling on 9/23/09.
//  Copyright 2009 vcom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

#define databataName    @"Yipei.sqlite3"

@protocol getDatabaseConn
@optional
	-(BOOL)connDatabase;

@end




@interface ConnectionDatabase : NSObject {
	id<getDatabaseConn> conn;
	 sqlite3 * smsDatabase;
}

@property(nonatomic)sqlite3 *smsDatabase;
@property(assign) id<getDatabaseConn> conn;
-(NSString *)databataPath;
-(BOOL)connDatabase;

@end

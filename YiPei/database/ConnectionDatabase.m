//
//  ConnectionDatabase.m
//  TableView
//
//  Created by du jianling on 9/23/09.
//  Copyright 2009 vcom. All rights reserved.
//

#import "ConnectionDatabase.h"


@implementation ConnectionDatabase
@synthesize smsDatabase;
@synthesize conn = _conn;

-(NSString *)databataPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* cachesDirectory = [paths objectAtIndex:0];
   // NSLog(@"cache dir=%@",cachesDirectory);
    return [cachesDirectory stringByAppendingPathComponent:databataName];
}

-(BOOL)connDatabase{
	if (sqlite3_open([[self databataPath] UTF8String], &smsDatabase) != SQLITE_OK) {
        sqlite3_close(smsDatabase);
        NSAssert(0, @"Error:  Failed to open database");
		NSLog(@"这里有输出11111");
		return NO;
    }else{
		return YES;
		NSLog(@"这里有输出");
	}
	return YES;
}

@end

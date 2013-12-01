//
//  userInfo.m
//  YiPei
//
//  Created by lee on 13-11-29.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import "sqlite3.h"
#import "model.h"
#import "userInfo.h"

@implementation userInfo
@synthesize groups;

//视图初始化时创建表
-(void)creatDatabase{
	if ([self connDatabase]) {
		char *errorMsg;
		
        NSString *myself=@"CREATE TABLE IF NOT EXISTS Myself (ID INTEGER PRIMARY KEY,USERID TEXT,CLIENTID TEXT,USERNAME TEXT,ISSPECIAL TEXT,NAME TEXT,LOGO TEXT,ADDR TEXT,CONTACT TEXT,TEL TEXT,MOBILE TEXT);";

		if (sqlite3_exec(smsDatabase, [myself UTF8String], NULL, NULL, &errorMsg)!=SQLITE_OK) {
			NSLog(@"个人数据没有创建成功");
			sqlite3_close(smsDatabase);
			NSAssert1(0,@"Error creating table:%s",errorMsg);
		}
		
        NSString *mycity=@"CREATE TABLE IF NOT EXISTS MyCity (ID INTEGER PRIMARY KEY,CITYID TEXT,CITYNAME TEXT);";
        
		if (sqlite3_exec(smsDatabase, [mycity UTF8String], NULL, NULL, &errorMsg)!=SQLITE_OK) {
			NSLog(@"个人城市没有创建成功");
			sqlite3_close(smsDatabase);
			NSAssert1(0,@"Error creating table:%s",errorMsg);
		}
	}
    
	sqlite3_close(smsDatabase);
}


-(void)addCityInfo:(NSString *)cID cityName:(NSString *)cName
{
	char *errorMsg;
	if([self connDatabase]){
            NSString *InsertData=[[NSString alloc]initWithFormat:@"INSERT OR REPLACE INTO MyCity (CITYID,CITYNAME) VALUES('%@','%@');",cID,cName];
		    int ok=sqlite3_exec(smsDatabase, [InsertData UTF8String], NULL, NULL, &errorMsg);
			if (ok==SQLITE_OK) {
				NSLog(@"插入组成员成功。。。。。。");
			}
	}
	sqlite3_close(smsDatabase);
	
}

- (citySite *)getCityInfo
{
    citySite *cityinfo = [[citySite alloc] init];
	if ([self connDatabase]) {
		NSString *query=@"SELECT CITYID, CITYNAME FROM MyCity;";
		sqlite3_stmt *statement;
		if (sqlite3_prepare_v2(smsDatabase, [query UTF8String], -1, &statement, nil)==SQLITE_OK) {
			NSLog(@"准备查询数据");
			
			while (sqlite3_step(statement)==SQLITE_ROW) {
				
				char *cityid=(char *)sqlite3_column_text(statement, 0);
                char *cityname=(char *)sqlite3_column_text(statement, 1);
				
				if (cityid!=nil) {
					cityinfo.cID=[NSString stringWithUTF8String:(const char*)cityid];
				}
				if (cityname!=nil) {
                    cityinfo.cName=[NSString stringWithUTF8String:(const char*)cityname];
                }
			}
			sqlite3_finalize(statement);
		}
		sqlite3_close(smsDatabase);
	}
	return cityinfo;
}

@end

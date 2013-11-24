//
//  NetConfig.h
//  TestApp
//
//  Created by lan chen on 9/5/11. 
//  Copyright 2011 zhejiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define speedUrl @"Home.aspx"
#define line1 @"api.360cec.com/index.php"
#define line2 @"api.360cec.com/index.php"

@interface NetConfig : NSObject {
    
    NSString  *server;
    int       useLine;
    int       svrport;
    NSString  *protocol;
    
}

@property (nonatomic,retain)NSString *server;
@property (nonatomic)int svrport;
@property (nonatomic)int useLine;
@property (nonatomic,retain)NSString *protocol;

+(NetConfig *)sharedNetConfig;

-(id)init;
-(id)initWithLine:(int)line;
-(NSString *)getDomainDesc;
-(BOOL)speedTest;

@end

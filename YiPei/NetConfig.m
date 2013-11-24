//
//  NetConfig.m
//  TestApp
//
//  Created by lan chen on 9/5/11.
//  Copyright 2011 zhejiang. All rights reserved.
//

#import "NetConfig.h"

@implementation NetConfig
@synthesize server;
@synthesize useLine;
@synthesize svrport;
@synthesize protocol;

static NetConfig *snc;

+(NetConfig *)sharedNetConfig
{
    if( !snc ){
        snc = [[NetConfig alloc] init];
    }
    
    return snc;
}

-(id)init
{
    self = [super init];
    
    //svrport = port;
    server = [[NSString alloc] initWithString:line1];
    useLine = 0;
    protocol = [[NSString alloc] initWithString:@"http://"];
    
    return self;
}

-(id)initWithLine:(int)line
{
    self = [super init];
    
   // svrport = port;
    protocol = [[NSString alloc] initWithString:@"http://"];
    useLine = line;
    
    switch (line) {
        case 0: //use Line1
            server = [[NSString alloc] initWithString:line1];
            break;
            
        default: // use Line2
            server = [[NSString alloc] initWithString:line2];           
            break;
    }
    
    return self;
}

-(void)changeLine:(int)line
{
    [server release];
    
    useLine = line;
    switch (line) {
        case 0: //use Line1
            server = [[NSString alloc] initWithString:line1];
            break;
            
        default: // use Line2
            server = [[NSString alloc] initWithString:line2];           
            break;
    }
    return;    
}

-(NSString *)getDomainDesc
{
    NSString *ret;
    
    ret = [[[NSString alloc] initWithString:protocol] autorelease];
    ret = [ret stringByAppendingString:server];
   // ret = [ret stringByAppendingString:@":"];
   // ret = [ret stringByAppendingFormat:@"%i" , svrport];
//    ret = [ret stringByAppendingString:@"/"];
    
    NSLog( ret );
    return ret;
}

-(BOOL)speedTest
{
    BOOL succ = FALSE;
    
    NSLog( @"start test net speed..." );
//line1 test    
    [self changeLine:0];
    
    NSString *surl = [[self getDomainDesc] stringByAppendingString:speedUrl ];
    NSURL *url = [NSURL URLWithString:surl];
    NSError *error = nil;
    NSString *context = [NSString alloc];
    
    NSDate *begin = [NSDate date];
    context = [context initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    NSTimeInterval line1time = [begin timeIntervalSinceNow] * -1000;
//    NSLog( context );
    [context release];

    if( [error code] != 0 ){
        NSLog( @"net line1 has error" );
        line1time = 9999999;
    } 
    NSLog( [NSString stringWithFormat:@"Line1 has time = %d" , line1time] );
    
//line2 test    
    [self changeLine:1];
    
    surl = [[self getDomainDesc] stringByAppendingString:speedUrl ];
    url = [ NSURL URLWithString:surl];
    error = nil;
    context = [NSString alloc];
    
    begin = [NSDate date];
    context = [context initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    NSTimeInterval line2time = [begin timeIntervalSinceNow] * -1000;
//    NSLog( context );
    [context release];
    
    NSLog( [NSString stringWithFormat:@"Line2 has time = %d" , line2time] );
    
    if( [error code] != 0 ){
        NSLog( @"net line2 has error" );
        
        [self changeLine:0];
        
        if( line1time == 9999999 )  return succ;
        else return TRUE;
    }
    
    succ = TRUE;
    
    if( line2time < line1time ){
        NSLog( @"line2 faster then line1 , now use line2");
    } else {
        NSLog( @"line2 slower then line1 , now use line1");
        [self changeLine:0];
    }
    NSLog( @"end speed test!" );
    
    return succ;
}

-(void)dealloc
{
    [server release];
    [protocol release];
    
    [super dealloc];
}
@end

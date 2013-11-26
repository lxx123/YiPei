


#import <Foundation/Foundation.h>
#import "JSONKit.h"
#import "NetCommand.h"
#import "allConfig.h"
#import "NetConfig.h"

@implementation NetCommand

@synthesize data;
@synthesize errorCode;
@synthesize errorMsg;

@synthesize paramDict;
@synthesize isComplete;

- (id)init {
	self = [super init];

    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    self.paramDict = dict;
	return self;
}

//- (void)dealloc {	
////	[currentProperty release];
//	[paramDict release];
//    [cmdUrl release];
////    [reqUrl release];
//	[data release];
//    [parser release];
//    [super dealloc];
//}


// 超时处理
- (void)parsingDidTimeout {
    if (self.isComplete == NO) {
//        [self.parser abortParsing];
        // Create your error and display it here
		
        // Try the fetch and parse again...
    }
}

- (void)execute {
	NSMutableString *reqUrl = [NSMutableString string];
	[reqUrl appendString:[[NetConfig sharedNetConfig] getDomainDesc]];
//	[reqUrl appendString:cmdUrl];
	
	if ([paramDict count] > 0) {
//		BOOL isFirst = TRUE;
		NSArray *allkeys = [paramDict allKeys];
//		if ([[[UIDevice currentDevice] systemVersion] doubleValue] < 4.0){
			
//			NSSortDescriptor *sd1 = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:NO];
//			NSArray *arrSort = [allkeys sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sd1, nil]];
//
            [reqUrl appendString:@"?"];
            
            [reqUrl appendString:@"m"];
            [reqUrl appendString:@"="];
            [reqUrl appendString:[paramDict valueForKey:@"m"]];
        
            [reqUrl appendString:@"&"];

            [reqUrl appendString:@"a"];
            [reqUrl appendString:@"="];
            [reqUrl appendString:[paramDict valueForKey:@"a"]];
            
			for (NSString *key in allkeys) {
//                if (isFirst) {
//					isFirst = FALSE;
//					[reqUrl appendString:@"?"];
//				} else {
//					[reqUrl appendString:@"&"];
//				}
                if (![key isEqualToString:@"m"] && ![key isEqualToString:@"m"]) {
                    [reqUrl appendString:@"&"];
                    [reqUrl appendString:key];
                    [reqUrl appendString:@"="];
                    [reqUrl appendString:[paramDict valueForKey:key]];
                }

			}
//			NSLog(@"1111111111111111111111111111111");
//		}else {
//			NSSortDescriptor *sd1 = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
//			NSArray *arrSort = [allkeys sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sd1, nil]];
//			NSLog(@"222222222222222222222222222222");
//			for (NSString *key in allkeys) {
//				if (isFirst) {
//					isFirst = FALSE;
//					[reqUrl appendString:@"?"];
//				} else {
//					[reqUrl appendString:@"&"];
//				}
//				[reqUrl appendString:key];
//				[reqUrl appendString:@"="];
//				[reqUrl appendString:[paramDict valueForKey:key]];
//			}
//		}

    }


    NSLog(@"reqUrl = %@", reqUrl);
    
	NSURL *url = [[NSURL alloc] initWithString:reqUrl];

	NSData *jsonData = [NSData dataWithContentsOfURL:url];
		
    
	@try {
        NSMutableDictionary *dictionary=[jsonData objectFromJSONData];
        
        self.errorCode = [[dictionary objectForKey:@"errorCode"]intValue];
        self.errorMsg = [dictionary objectForKey:@"errorMsg"];
        self.data = [dictionary objectForKey:@"data"];

	}
	@catch (NSException * e) {
		NSLog(@"execute,error=%@",e);
	}
	@finally {
		
	}
	
}

@end
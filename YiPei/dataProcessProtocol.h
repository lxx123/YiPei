//
//  dataProcessProtocol.h
//  YiPei
//
//  Created by lee on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol dataProcessProtocol <NSObject>
@required
- (void) didDataSuccess : (NSString *)data;
- (void) didDataFailed : (NSString *)err;
@end

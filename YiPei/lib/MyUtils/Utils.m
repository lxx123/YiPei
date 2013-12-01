//
//  Utils.m
//  YiPei
//
//  Created by daichuanning on 13-11-30.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "Utils.h"

@implementation Utils


//汉字的首字母
+ (NSString *)firstLatter:(NSString *)str {
    if ([@"长" isEqualToString:[str substringToIndex:1]] || [@"重" isEqualToString:[str substringToIndex:1]]) {
        return @"c";
    }
    NSMutableString *newStr = [NSMutableString stringWithString:str];
    CFRange range = CFRangeMake(0, newStr.length);
    CFStringTransform((CFMutableStringRef)newStr, &range, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)newStr, &range, kCFStringTransformStripCombiningMarks, NO);
    return [newStr substringToIndex:1];
}

@end

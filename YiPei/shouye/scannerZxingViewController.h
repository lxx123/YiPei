//
//  scannerZxingViewController.h
//  YiPei
//
//  Created by lee on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZXingWidgetController.h"

@interface scannerZxingViewController : UIViewController<ZXingDelegate>
{
//    NSArray *actions;
//    ParsedResult *result;
}
//@property (nonatomic,assign) NSArray *actions;
//@property (nonatomic,assign) ParsedResult *result;

- (void)startScannerZxing;

- (void)zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)result;
- (void)zxingControllerDidCancel:(ZXingWidgetController*)controller;
@end

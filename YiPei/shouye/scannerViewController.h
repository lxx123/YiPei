//
//  scannerViewController.h
//  YiPei
//
//  Created by lee on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class scannerVinViewController;
@class scannerZxingViewController;

@interface scannerViewController : UIViewController
{
    scannerVinViewController *vinVc;
    scannerZxingViewController *zxingVc;
}

@property(nonatomic, retain) scannerVinViewController *vinVc;
@property(nonatomic, retain) scannerZxingViewController *zxingVc;

@end

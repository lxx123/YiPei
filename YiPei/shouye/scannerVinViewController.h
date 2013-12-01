//
//  scannerVinViewController.h
//  YiPei
//
//  Created by lee on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBProgressHUD;

@class Tesseract;
@interface scannerVinViewController :UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImage *img;
    Tesseract *tesseract;
}

@property (nonatomic, strong) NSString *scannerVString;
@property (nonatomic, strong) UIImage *img;

@property (nonatomic, strong)  Tesseract *tesseract;

@end

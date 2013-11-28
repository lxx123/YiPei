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
    MBProgressHUD *progressHud;
    Tesseract* tesseract;
    uint32_t *pixels;
}

@property (nonatomic, strong) MBProgressHUD *progressHud;
@property (nonatomic, strong) Tesseract* tesseract;

- (void)setTesseractImage:(UIImage *)image;

@end

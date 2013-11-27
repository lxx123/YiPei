//
//  scannerVinViewController.h
//  YiPei
//
//  Created by lee on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#include <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
@interface scannerVinViewController : UIViewController<
                                            UINavigationControllerDelegate
                                            #if HAS_AVFF
                                                ,AVCaptureVideoDataOutputSampleBufferDelegate
                                            #endif
                                        >
{
    
#if HAS_AVFF
    AVCaptureSession *captureSession;
    AVCaptureVideoPreviewLayer *prevLayer;
    
#endif
}
#if HAS_AVFF
@property (nonatomic, retain) AVCaptureSession *captureSession;
@property (nonatomic, retain) AVCaptureVideoPreviewLayer *prevLayer;
#endif
@end

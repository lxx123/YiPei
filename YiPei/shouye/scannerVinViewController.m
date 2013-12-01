//
//  scannerVinViewController.m
//  YiPei
//
//  Created by lee on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "scannerVinViewController.h"
#import "MBProgressHUD.h"
#import "Tesseract.h"

@interface scannerVinViewController ()
@end

@implementation scannerVinViewController
@synthesize scannerVString;
@synthesize img=_img;
@synthesize tesseract=_tesseract;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)processOcrAt:(UIImage *)image
{
    _tesseract = [[Tesseract alloc] initWithDataPath:@"/tessdata" language:@"eng"];
    [_tesseract setImage:image];
    //    [self setTesseractImage:image];
    
    
    // Uncomment to only search for alpha-numeric characters.
    [_tesseract setVariableValue:@"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" forKey:@"tessedit_char_whitelist"];
    
    [_tesseract recognize];
    NSLog(@"%@",[_tesseract recognizedText]);
    
}

- (void)ocrProcessingFinished:(NSString *)result
{
    [[[UIAlertView alloc] initWithTitle:@"Tesseract Sample"
                                message:[NSString stringWithFormat:@"解析结果：\n%@", result]
                               delegate:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:@"OK", nil] show];
}



- (void)viewDidUnload
{
    [super viewDidUnload];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    _imgview.frame = CGRectMake(0, 0, 320, 400);
    [self processOcrAt:_img];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

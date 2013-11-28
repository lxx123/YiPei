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
-(void)load:(UIImage*)image;
@end

@implementation scannerVinViewController
@synthesize progressHud;
@synthesize tesseract= _tesseract;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        // Set up the tessdata path. This is included in the application bundle
        // but is copied to the Documents directory on the first run.
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentPath = ([documentPaths count] > 0) ? [documentPaths objectAtIndex:0] : nil;
        
        NSString *dataPath = [documentPath stringByAppendingPathComponent:@"tessdata"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        // If the expected store doesn't exist, copy the default store.
        if (![fileManager fileExistsAtPath:dataPath]) {
            // get the path to the app bundle (with the tessdata dir)
            NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
            NSString *tessdataPath = [bundlePath stringByAppendingPathComponent:@"tessdata"];
            if (tessdataPath) {
                [fileManager copyItemAtPath:tessdataPath toPath:dataPath error:NULL];
            }
        }
        
        setenv("TESSDATA_PREFIX", [[documentPath stringByAppendingString:@"/"] UTF8String], 1);
    }
    return self;
}

//二值化
- (UIImage *)convertToGrayscale:(UIImage*)img{
    
    CGSize size = [img size];
    
    int width = size.width;
    
    int height = size.height;
    
    // the pixels will be painted to this array
    
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // clear the pixels so any transparency is preserved
    
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a context with RGBA pixels
    
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace,
                                                 
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // paint the bitmap to our context which will fill in the pixels array
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [img CGImage]);
    
    int tt = 1;
    
    CGFloat intensity;
    
    int bw;
    
    for(int y = 0; y < height; y++) {
        
        for(int x = 0; x < width; x++) {
            
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            intensity = (rgbaPixel[tt] + rgbaPixel[tt + 1] + rgbaPixel[tt + 2]) / 3. / 255.;
            
            if (intensity > 0.45) {
                
                bw = 255;
                
            } else {
                
                bw = 0;
                
            }
            
            rgbaPixel[tt] = bw;
            
            rgbaPixel[tt + 1] = bw;
            
            rgbaPixel[tt + 2] = bw;
            
        }
        
    }
    
    // create a new CGImageRef from our context with the modified pixels
    
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    // we're done with the context, color space, and pixels
    
    CGContextRelease(context);
    
    CGColorSpaceRelease(colorSpace);
    
    free(pixels);
    
    // make a new UIImage to return
    
    UIImage *resultUIImage = [UIImage imageWithCGImage:image];
    
    // we're done with image now too
    
    CGImageRelease(image);
    
    return resultUIImage;
}


//灰度

-(UIImage *)grayImage:(UIImage *)source
{
    int width = source.size.width;
    int height = source.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    CGContextRef context = CGBitmapContextCreate (nil,
                                                  width,
                                                  height,
                                                  8,      // bits per component
                                                  0,
                                                  colorSpace,
                                                  kCGImageAlphaNone);
    
    CGColorSpaceRelease(colorSpace);
    
    if (context == NULL) {
        return nil;
    }
    
    CGContextDrawImage(context,
                       CGRectMake(0, 0, width, height), source.CGImage);
    
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    
    return grayImage;
}


-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType= UIImagePickerControllerSourceTypeCamera;
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"没有相机");
    }
    
    UIImagePickerController* picker=[[UIImagePickerController alloc] init];
    
    picker.delegate=self;
    picker.allowsEditing=YES;
    picker.sourceType= sourceType;
    
    [self presentModalViewController:picker animated:YES];
    
}



-(void)load:(UIImage*)image
{
    //二值
    UIImage* tmp_img=[self convertToGrayscale:image];
    //灰度
    UIImage *image2 = [self grayImage:tmp_img];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image2];
    
    
    imageView.frame = CGRectMake(0, 0, 320, 400);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
    self.progressHud = [[MBProgressHUD alloc] initWithView:self.view];
    self.progressHud.labelText = @"OCR 识别中";
    
    [self.view addSubview:self.progressHud];
    [self.progressHud showWhileExecuting:@selector(processOcrAt:) onTarget:self withObject:image animated:YES];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissModalViewControllerAnimated:YES];
    
    UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    [self load:image];
    
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


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    if (![self.progressHud isHidden])
        [self.progressHud hide:NO];
    self.progressHud = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

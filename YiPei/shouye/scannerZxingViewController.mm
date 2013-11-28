//
//  scannerZxingViewController.m
//  YiPei
//
//  Created by lee on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "scannerZxingViewController.h"
#import <MultiFormatReader.h>

@interface scannerZxingViewController ()

@end

@implementation scannerZxingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)startScannerZxing
{
    ZXingWidgetController *widController = [[ZXingWidgetController alloc] initWithDelegate:self showCancel:YES OneDMode:NO];
    MultiFormatReader* qrcodeReader = [[MultiFormatReader alloc] init];
    NSSet *readers = [[NSSet alloc ] initWithObjects:qrcodeReader,nil];
    widController.readers = readers;
    NSBundle *mainBundle = [NSBundle mainBundle];
//    widController.soundToPlay =
//    [NSURL fileURLWithPath:[mainBundle pathForResource:@"beep-beep" ofType:@"aiff"] isDirectory:NO];
    [self presentModalViewController:widController animated:YES];
}

#pragma mark -
#pragma mark ZXingDelegateMethods
- (void)zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)resultString {
    [self dismissModalViewControllerAnimated:YES];
#if ZXING_DEBUG
    NSLog(@"result has %d actions", actions ? 0 : actions.count);
#endif
    
//    ParsedResult *parsedResult = [UniversalResultParser parsedResultForString:resultString];
}

- (void)zxingControllerDidCancel:(ZXingWidgetController*)controller {
    [self dismissModalViewControllerAnimated:YES];
    NSString *returnUrl = [[NSUserDefaults standardUserDefaults] stringForKey:@"returnURL"];
    if (returnUrl != nil) {
        UIAlertView* alert = [[UIAlertView alloc]
                              initWithTitle:@"Return to website?"
                              message:nil
                              delegate:self
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"Return", nil];
        [alert show];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self startScannerZxing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

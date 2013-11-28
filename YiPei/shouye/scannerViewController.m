//
//  scannerViewController.m
//  YiPei
//
//  Created by lee on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "scannerViewController.h"
#import "scannerVinViewController.h"
#import "scannerZxingViewController.h"

@interface scannerViewController ()

@end

@implementation scannerViewController
@synthesize vinVc = _vinVc;
@synthesize zxingVc = _zxingVc;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _vinVc = [[scannerVinViewController  alloc] init];
    _zxingVc = [[scannerZxingViewController alloc] init];
    
    [self.view addSubview:_vinVc.view];
    [self.view addSubview:_zxingVc.view];
    [_vinVc.view setHidden:YES];
    [_zxingVc startScannerZxing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

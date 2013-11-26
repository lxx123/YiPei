//
//  GuoWuCheViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "GuoWuCheViewController.h"

@interface GuoWuCheViewController ()

@end

@implementation GuoWuCheViewController
@synthesize tableview=_tableview;
@synthesize quanXuanBT=_quanXuanBT;
@synthesize zongJiaLabel=_zongJiaLabel;
@synthesize shanChuBT=_shanChuBT;
@synthesize jieSuanBT=_jieSuanBT;
@synthesize queDingView=_queDingView;
@synthesize JiaNum=_JiaNum;
@synthesize JianNum=_JianNum;
@synthesize geShu=_geShu;
@synthesize quexiaoBT=_quexiaoBT;
@synthesize quDingBT=_quDingBT;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

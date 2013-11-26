//
//  JiangJiaTongZhiViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-11-25.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "JiangJiaTongZhiViewController.h"

@interface JiangJiaTongZhiViewController ()

@end

@implementation JiangJiaTongZhiViewController
@synthesize PriceLabel=_PriceLabel;
@synthesize caiGouPriceText=_caiGouPriceText;
@synthesize caiGouNumber=_caiGouNumber;
@synthesize fanDian=_fanDian;
@synthesize paiZhaoV=_paiZhaoV;
@synthesize paiZhaoBT=_paiZhaoBT;
@synthesize zhaoPianV=_zhaoPianV;
@synthesize zhaoPian=_zhaoPian;
@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    self.navigationController.navigationBar.backgroundColor=[UIColor darkGrayColor];
    self.title=@"降价通知";
    
    _leftitem=[[UIButton alloc]initWithFrame:CGRectMake(20, 14, 50, 30)] ;
    _leftitem.backgroundColor=[UIColor clearColor];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back.png"] forState:UIControlStateNormal];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back_press.png"] forState:UIControlStateHighlighted];
    [_leftitem addTarget:self action:@selector(clickFanHuiBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_leftitem];
    
    _rightitem=[[UIButton alloc]initWithFrame:CGRectMake(270, 14, 30, 30)] ;
    _rightitem.tag=3;
    _rightitem.backgroundColor=[UIColor clearColor];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart.png"] forState:UIControlStateNormal];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart_press.png"] forState:UIControlStateHighlighted];
    [_rightitem addTarget:self action:@selector(clickShoppingCartBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_rightitem];
    
    _caiGouPriceText.delegate=self;
    _caiGouNumber.delegate=self;
    _fanDian.delegate=self;
}






























- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

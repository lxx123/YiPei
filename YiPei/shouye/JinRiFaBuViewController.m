//
//  JinRiFaBuViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-12-1.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "JinRiFaBuViewController.h"
#import "GuoWuCheViewController.h"
#import "AppDelegate.h"
#import "CustomTabBar.h"
#import "ProductDetailsViewController.h"
@interface JinRiFaBuViewController (){
    BOOL isXiaoling;//yes为升序  no为降序
    BOOL isJiaGe;////yes为升序  no为降序

}

@end

@implementation JinRiFaBuViewController
@synthesize tableview=_tableview;
@synthesize moRenBT=_moRenBT;
@synthesize xiaoLiangBT=_xiaoLiangBT;
@synthesize xiaoLiangImage=_xiaoLiangImage;
@synthesize jiaGeBT=_jiaGeBT;
@synthesize jiaGeImage=_jiaGeImage;
@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated{
    isXiaoling=YES;
    isJiaGe=NO;
    _xiaoLiangImage.image=[UIImage imageNamed:@"icon_arrow_down.png"];
    _jiaGeImage.image=[UIImage imageNamed:@"icon_arrow_up.png"];
    
}






- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *app=[AppDelegate shsharedeApp];
    [app.tabBarController bringCustomTabBarToFront];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    self.navigationController.navigationBar.backgroundColor=[UIColor darkGrayColor];
    self.title=@"今日发布";
    _leftitem=[[UIButton alloc]initWithFrame:CGRectMake(20, 14, 50, 30)] ;
    _leftitem.backgroundColor=[UIColor clearColor];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back.png"] forState:UIControlStateNormal];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back_press.png"] forState:UIControlStateHighlighted];
    [_leftitem addTarget:self action:@selector(clickFanHuiBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_leftitem];
    
    _rightitem=[[UIButton alloc]initWithFrame:CGRectMake(270, 14, 50, 30)] ;
    _rightitem.tag=3;
    _rightitem.backgroundColor=[UIColor clearColor];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart.png"] forState:UIControlStateNormal];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart_press.png"] forState:UIControlStateHighlighted];
    [_rightitem addTarget:self action:@selector(clickShoppingCartBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_rightitem];
    
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.backgroundColor=[UIColor clearColor];
    _tableview.rowHeight=65;
    _tableview.separatorColor=[UIColor darkGrayColor];
    [_tableview reloadData];
    
}

//返回
-(IBAction)clickFanHuiBT:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

//购物车
-(IBAction)clickShoppingCartBT:(id)sender{
    GuoWuCheViewController *guowucheVC=[[GuoWuCheViewController alloc]initWithNibName:@"GuoWuCheViewController" bundle:nil];
    [self.navigationController pushViewController:guowucheVC animated:YES];
}

//默认按钮
-(IBAction)clickmoRenBT:(id)sender{
    [_tableview reloadData];

}

//销量
-(IBAction)clickxiaoLiangBT:(id)sender{
    if (isXiaoling) {
        isXiaoling=NO;
        _xiaoLiangImage.image=[UIImage imageNamed:@"icon_arrow_up.png"];
    }else{
        isXiaoling=YES;
        _xiaoLiangImage.image=[UIImage imageNamed:@"icon_arrow_down.png"];
    }
    [_tableview reloadData];
}

//价格
-(IBAction)clickjiaGeBT:(id)sender{
    if (isJiaGe) {
        isJiaGe=NO;
        _jiaGeImage.image=[UIImage imageNamed:@"icon_arrow_up.png"];
    }else{
        isJiaGe=YES;
        _jiaGeImage.image=[UIImage imageNamed:@"icon_arrow_down.png"];
    }
   [_tableview reloadData];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier =[NSString stringWithFormat: @"mycell%d",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor clearColor];
    }
    UIView *spcell = [cell viewWithTag:1002];
    if (spcell==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"JinRiFaBuCell" owner:self options:nil];
        spcell=[nib objectAtIndex:0];
        spcell.backgroundColor=[UIColor clearColor];
        [cell addSubview:spcell];
    }
    //UIImageView *imageview=(UIImageView *)[spcell viewWithTag:1];
    UILabel *nameLa=(UILabel *)[spcell viewWithTag:2];
    nameLa.text=[NSString stringWithFormat:@"博世 空调滤清器 0986AF5401"];
    
    UILabel *chengjiaLa=(UILabel *)[spcell viewWithTag:3];
    chengjiaLa.text=@"1200件";
    
    UILabel *jiaGeLa=(UILabel *)[spcell viewWithTag:4];
    jiaGeLa.text=@"¥90.00";

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductDetailsViewController *ProductVc=[[ProductDetailsViewController alloc]initWithNibName:@"ProductDetailsViewController" bundle:nil];
    [self.navigationController pushViewController:ProductVc animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

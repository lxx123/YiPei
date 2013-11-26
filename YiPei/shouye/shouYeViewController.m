//
//  shouYeViewController.m
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "shouYeViewController.h"
#import "model.h"
#import "todayDiscountFunc.h"
#import "ProductDetailsViewController.h"



@interface shouYeViewController ()

@end

@implementation shouYeViewController
@synthesize todayDiscount=_todayDiscount;
@synthesize tableview=_tableview;
@synthesize personalInfoView=_personalInfoView;
@synthesize searchView=_searchView;

@synthesize shouyeView=_shouyeView;
@synthesize shouyeBT=_shouyeBT;
@synthesize shouyeImage=_shouyeImage;
@synthesize shouyeLabel=_shouyeLabel;
@synthesize shouyeArrow=_shouyeArrow;

@synthesize useBT=_useBT;
@synthesize useNameLabel=_useNameLabel;
@synthesize useImage=_useImage;
@synthesize useArrow=_useArrow;

@synthesize cartBT=_cartBT;
@synthesize cartLabel=_cartLabel;
@synthesize cartArow=_cartArow;
@synthesize cartImage=_cartImage;
@synthesize shoppingCartNumLabel=_shoppingCartNumLabel;
@synthesize shoppingCartView=_shoppingCartView;

@synthesize InfoView=_InfoView;
@synthesize payBT=_payBT;
@synthesize payLabel=_payLabel;
@synthesize payArow=_payArow;
@synthesize payImage=_payImage;

@synthesize instructionsBT=_instructionsBT;
@synthesize instructionsLabel=_instructionsLabel;
@synthesize instructionsArow=_instructionsArow;
@synthesize instructionsImage=_instructionsImage;

@synthesize contactBT=_contactBT;
@synthesize contactLabel=_contactLabel;
@synthesize contactArow=_contactArow;
@synthesize contactImage=_contactImage;

@synthesize updateBT=_updateBT;
@synthesize updateLabel=_updateLabel;
@synthesize updateArow=_updateArow;
@synthesize updateImage=_updateImage;

@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;

@synthesize todayNewData=_todayNewData;
@synthesize todayDisCountArray =_todayDisCountArray;

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
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    self.navigationController.navigationBar.backgroundColor=[UIColor darkGrayColor];
    self.title=@"淘汽档口";
    
    _leftitem=[[UIButton alloc]initWithFrame:CGRectMake(20, 14, 30, 30)] ;
    _leftitem.backgroundColor=[UIColor clearColor];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_intercalate.png"] forState:UIControlStateNormal];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_intercalate_press.png"] forState:UIControlStateHighlighted];
    [_leftitem addTarget:self action:@selector(clickPersonalInfoBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_leftitem];
    
    _rightitem=[[UIButton alloc]initWithFrame:CGRectMake(270, 14, 30, 30)] ;
    _rightitem.tag=3;
    _rightitem.backgroundColor=[UIColor clearColor];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart.png"] forState:UIControlStateNormal];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart_press.png"] forState:UIControlStateHighlighted];
    [_rightitem addTarget:self action:@selector(clickShoppingCartBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_rightitem];
    
    _shouyeView.layer.cornerRadius = 6;
    _InfoView.layer.cornerRadius=6;
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.rowHeight=64;
    _tableview.backgroundColor=[UIColor clearColor];
    _tableview.hidden=NO;
    _searchView.hidden=NO;
    _personalInfoView.hidden=YES;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _todayDiscount = [[todayDiscountFunc alloc] init];
    _todayDiscount.delegate = self;
    [_todayDiscount getTodayDiscount:@"0" Index:@"0" sortPrice:@"0" sortSale:@"0"];
}
- (void) didTodayDiscountDataSuccess : (id)data
{
    NSLog(@"shouYeViewController:didDataSuccess!");
    NSArray *trans = (NSArray *)data;
    NSArray *disCount = [trans objectAtIndex:0];
    _todayDisCountArray = [[NSMutableArray alloc] init];
    for (int i=0; i<disCount.count;i++ ) {
        todayDiscountGoods *goods = [[todayDiscountGoods alloc] init];
        goods.min_price = [[disCount objectAtIndex:i]objectForKey:@"min_price"];    //最低价格
        goods.market_price = [[disCount objectAtIndex:i]objectForKey:@"market_price"]; //商品原价
        goods.goods_id = [[disCount objectAtIndex:i]objectForKey:@"goods_id"];     //商品id
        goods.goods_sn = [[disCount objectAtIndex:i]objectForKey:@"goods_sn"];     //商品编号
        goods.goods_name = [[disCount objectAtIndex:i]objectForKey:@"goods_name"];   //商品名称
        goods.goods_sale_amount = [[disCount objectAtIndex:i]objectForKey:@"goods_sale_amount"];//商品销售量
        goods.goods_format = [[disCount objectAtIndex:i]objectForKey:@"goods_format"];
        goods.goodsAttrs = [[disCount objectAtIndex:i]objectForKey:@"goodsAttrs"];//商品属性（有多个），基本数据结构如下
        [_todayDisCountArray addObject:goods];
    }
    @try {
        NSDictionary* newDic =  [trans objectAtIndex:1];
        _todayNewData = [[todayNew alloc]init];
        _todayNewData.goods_id = [newDic objectForKey:@"goods_id"];
        _todayNewData.goods_name = [newDic objectForKey:@"goods_name"];
        _todayNewData.goods_sn = [newDic objectForKey:@"goods_sn"];
        _todayNewData.market_price = [newDic objectForKey:@"market_price"];
        _todayNewData.min_price = [newDic objectForKey:@"min_price"];
        
    }@catch (NSException *e) {
        NSLog(@"didTodayDiscountDataSuccess err=%@",e);
    }
}

- (void) didTodayDiscountDataFailed:(NSString *)err
{
    NSLog(@"shouYeViewController:didDataFailed!");
}


//搜索
-(IBAction)clickSearchBT:(id)sender{

}

//扫一扫
-(IBAction)clickToSweep:(id)sender{

}

//个人信息
-(void)clickPersonalInfoBT:(id)sender{
    if (_tableview.hidden) {
        _tableview.hidden=NO;
        _searchView.hidden=NO;
        _personalInfoView.hidden=YES;
    }else{
        _tableview.hidden=YES;
        _searchView.hidden=YES;
        _personalInfoView.hidden=NO;
    }
}

//首页按钮
-(IBAction)clickShouYeBT:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
}

//个人中心
-(IBAction)clickUseNameBT:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
}

//购物车
-(IBAction)clickShoppingCartBT:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
}

//支付帮助
-(IBAction)clickPaymentBT:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
}

//使用说明
-(IBAction)clickInstructionsBt:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
}

//联系我们
-(IBAction)clickContactBT:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
}

//更新
-(IBAction)clickUpdateBT:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
}

//点击按钮视图的变化
-(void)updateview:(NSInteger)tag{
    if (tag==1) {
        _shouyeBT.backgroundColor=[UIColor yellowColor];
        _shouyeArrow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _shouyeLabel.textColor=[UIColor blackColor];
        _shouyeImage.image=[UIImage imageNamed:@"icon_home_press.png"];
    }else{
        _shouyeBT.backgroundColor=[UIColor clearColor];
        _shouyeArrow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _shouyeLabel.textColor=[UIColor whiteColor];
        _shouyeImage.image=[UIImage imageNamed:@"icon_home.png"];
    }
    if (tag==2) {
        _useBT.backgroundColor=[UIColor yellowColor];
        _useArrow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _useNameLabel.textColor=[UIColor blackColor];
        _useImage.image=[UIImage imageNamed:@"icon_user_press.png"];
    }else{
        _useBT.backgroundColor=[UIColor clearColor];
        _useArrow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _useNameLabel.textColor=[UIColor whiteColor];
        _useImage.image=[UIImage imageNamed:@"icon_user.png"];
    }
    if (tag==3) {
        _cartBT.backgroundColor=[UIColor yellowColor];
        _cartArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _cartLabel.textColor=[UIColor blackColor];
        _cartImage.image=[UIImage imageNamed:@"icon_cart_press.png"];
    }else{
        _cartBT.backgroundColor=[UIColor clearColor];
        _cartArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _cartLabel.textColor=[UIColor whiteColor];
        _cartImage.image=[UIImage imageNamed:@"icon_cart.png"];
    }
    if (tag==4) {
        _payBT.backgroundColor=[UIColor yellowColor];
        _payArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _payLabel.textColor=[UIColor blackColor];
        _payImage.image=[UIImage imageNamed:@"icon_pay_press.png"];
    }else{
        _payBT.backgroundColor=[UIColor clearColor];
        _payArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _payLabel.textColor=[UIColor whiteColor];
        _payImage.image=[UIImage imageNamed:@"icon_pay.png"];
    }
    if (tag==5) {
        _instructionsBT.backgroundColor=[UIColor yellowColor];
        _instructionsArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _instructionsLabel.textColor=[UIColor blackColor];
        _instructionsImage.image=[UIImage imageNamed:@"icon_use_press.png"];
    }else{
        _instructionsBT.backgroundColor=[UIColor clearColor];
        _instructionsArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _instructionsLabel.textColor=[UIColor whiteColor];
        _instructionsImage.image=[UIImage imageNamed:@"icon_use.png"];
    }
    if (tag==6) {
        _contactBT.backgroundColor=[UIColor yellowColor];
        _contactArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _contactLabel.textColor=[UIColor blackColor];
        _contactImage.image=[UIImage imageNamed:@"icon_contact_press.png"];
    }else{
        _contactBT.backgroundColor=[UIColor clearColor];
        _contactArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _contactLabel.textColor=[UIColor whiteColor];
        _contactImage.image=[UIImage imageNamed:@"icon_contact.png"];
    }
    if (tag==7) {
        _updateBT.backgroundColor=[UIColor yellowColor];
        _updateArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _updateLabel.textColor=[UIColor blackColor];
        _updateImage.image=[UIImage imageNamed:@"icon_update_press.png"];
    }else{
        _updateBT.backgroundColor=[UIColor clearColor];
        _updateArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _updateLabel.textColor=[UIColor whiteColor];
        _updateImage.image=[UIImage imageNamed:@"icon_update.png"];
    }
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 22)];
    headerView.backgroundColor=[UIColor lightGrayColor];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 60, 22)];
    label.backgroundColor=[UIColor clearColor];
    label.font=[UIFont systemFontOfSize:14.0f];
    label.textColor=[UIColor darkGrayColor];
    [headerView addSubview:label];
    if (section==0) {
        label.text=@"今天发布";
    }else{
        label.text=@"今天特价";
    }
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section==1){
        return _todayDisCountArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    UIView *spcell = [cell viewWithTag:1000];
    if (spcell==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"shouYeCell" owner:self options:nil];
        spcell=[nib objectAtIndex:0];
        [cell addSubview:spcell];
    }
    NSString *name;
    NSString *xingHao;
    NSString *yuanjia;
    NSString *price;
    if (indexPath.section  == 0) {
        name = _todayNewData.goods_name;
        xingHao = _todayNewData.goods_format;
        yuanjia = _todayNewData.market_price;
        price = _todayNewData.min_price;
    }
    else if(indexPath.section == 1)
    {
        todayDiscountGoods *goods = [_todayDisCountArray objectAtIndex:indexPath.row];
        name = goods.goods_name;
        xingHao = goods.goods_format;
        price = goods.min_price;
    }
    UILabel *NameLa=(UILabel *)[spcell viewWithTag:2];
    NameLa.text=name;//@"MANN 空气滤清器";
    NameLa.textColor=[UIColor blackColor];
    NameLa.font=[UIFont systemFontOfSize:15.0f];
    UILabel *xingHaoLa=(UILabel *)[spcell viewWithTag:3];
    xingHaoLa.text=xingHao;//@"美孚（ow-40）sn 1l装";
    xingHaoLa.textColor=[UIColor darkGrayColor];
    xingHaoLa.font=[UIFont systemFontOfSize:14.0f];
    
    
    UILabel *yuanPrice=(UILabel *)[spcell viewWithTag:5];
    yuanPrice.frame=CGRectMake(yuanPrice.frame.origin.x, 18, yuanPrice.frame.size.width, yuanPrice.frame.size.height);
    yuanPrice.text=yuanjia;//@"¥92.00";
    yuanPrice.hidden=NO;
    yuanPrice.textColor=[UIColor darkGrayColor];
    yuanPrice.font=[UIFont systemFontOfSize:14.0f];
    UILabel *priceLabel=(UILabel *)[spcell viewWithTag:4];
    if (yuanPrice.hidden) {
        priceLabel.frame=CGRectMake(priceLabel.frame.origin.x, 25, priceLabel.frame.size.width, priceLabel.frame.size.height);
    }else{
        priceLabel.frame=CGRectMake(priceLabel.frame.origin.x, 42, priceLabel.frame.size.width, priceLabel.frame.size.height);
    }
    priceLabel.hidden=NO;
    priceLabel.text=price;//@"¥100.00";
    priceLabel.textColor=[UIColor redColor];
    priceLabel.font=[UIFont systemFontOfSize:15.0f];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
    {
        
    }
    else if(indexPath.section == 1)
    {
        ProductDetailsViewController *ProductVc=[[ProductDetailsViewController alloc]initWithNibName:@"ProductDetailsViewController" bundle:nil];
        NSLog(@"section=%d,index=%d",indexPath.section,indexPath.row);
        todayDiscountGoods *goods = [_todayDisCountArray objectAtIndex:indexPath.row];
        ProductVc.pid = goods.goods_id;
        [self.navigationController pushViewController:ProductVc animated:YES];
    }

}















- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ProductDetailsViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "ProductDetailsViewController.h"
#define SPECIFICATIONTABLE_TAG 1001
#define INFORMATIONTABLE_TAG 1002
#import "Cell1.h"
#import "Cell2.h"
#import "AppDelegate.h"
#import "CustomTabBar.h"

#import "JiangJiaTongZhiViewController.h"
#import "GuoWuCheViewController.h"
#import "model.h"

#import "goodInfoDetailFunc.h"
#import "searchFunc.h"

@interface ProductDetailsViewController (){
    float scrollheight;
    float AdditionHeight;
    //float guiGeTableHeight;
    float butViewY;
    float BackY;
    NSMutableArray *GuiGeArray;
    NSArray *infoArray;
    NSArray *sheHeCheXingArray;
}
@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;

@end

@implementation ProductDetailsViewController
@synthesize ContenrScroll=_ContenrScroll;
@synthesize contenrBack=_contenrBack;
@synthesize imageView=_imageView;
@synthesize imageBackView=_imageBackView;
@synthesize imageScroll=_imageScroll;
@synthesize leftImageBT=_leftImageBT;
@synthesize rightImageBT=_rightImageBT;

@synthesize infoView=_infoView;
@synthesize nameLabel=_nameLabel;
@synthesize jianJieLabel=_jianJieLabel;
@synthesize NowPrice=_NowPrice;
@synthesize priceShuoming=_priceShuoming;
@synthesize yuanPrice=_yuanPrice;
@synthesize chengJiaoLiangLa=_chengJiaoLiangLa;
@synthesize jianJiaBT=_jianJiaBT;
@synthesize gouMaiNum=_gouMaiNum;
@synthesize jianBT=_jianBT;
@synthesize jiaBT=_jiaBT;

@synthesize guiGeView=_guiGeView;
@synthesize guiGeTable=_guiGeTable;
@synthesize detailedTable=_detailedTable;
@synthesize butView=_butView;
@synthesize gouMaiBT=_gouMaiBT;
@synthesize gouWuCheBT=_gouWuCheBT;
@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;

@synthesize goodInfoFunc=_goodInfoFunc;
@synthesize pid=_pid;
@synthesize barcode=_barcode;
@synthesize searchfunc = _searchfunc;
@synthesize guiGeArray=_guiGeArray;

@synthesize isOpen,selectIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _pid = nil;
        _barcode = nil;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];


}

- (void) didGoodsInfoDataSuccess : (id)data;
{
    NSLog(@"didGoodsInfoDataSuccess");
    _info = [[GoodsInfo alloc] init];
    
    _info.min_price = [data objectForKey:@"min_price"];
    _info.market_price = [data objectForKey:@"market_price"];
    _info.goods_id = [data objectForKey:@"goods_id"];
    _info.supplier_id = [data objectForKey:@"supplier_id"];
    _info.warehouse_id = [data objectForKey:@"warehouse_id"];
    _info.goods_sn = [data objectForKey:@"goods_sn"];
    _info.goods_barcode = [data objectForKey:@"barcode"];
    _info.goods_format = [data objectForKey:@"goods_format"];
    _info.package_format = [data objectForKey:@"package_format"];
    _info.brand_name = [data objectForKey:@"brand_name"];
    _info.measure_unit = [data objectForKey:@"measure_unit"];
    _info.product_company = [data objectForKey:@"product_company"];
    _info.goods_name = [data objectForKey:@"goods_name"];
    _info.goods_brief = [data objectForKey:@"goods_name"];
    _info.goods_desc = [data objectForKey:@"goods_desc"];
    _info.goods_thumb = [data objectForKey:@"goods_thumb"];
    _info.goods_img = [data objectForKey:@"goods_img"];
    _info.original_img = [data objectForKey:@"original_img"];
    _info.goods_sale_amount = [data objectForKey:@"goods_sale_amount"];
    
    _info.goods_attrs = [data objectForKey:@"goods_attr"];
    _info.volume_price = [data objectForKey:@"volume_price"];
    _info.goods_car = [data objectForKey:@"goods_car"];
    
    _info.service_after_title = [data objectForKey:@"service_after_title"];
    _info.service_after_content = [data objectForKey:@"service_after_content"];
    _info.slogan_title = [data objectForKey:@"slogan_title"];
    _info.slogan_content = [data objectForKey:@"slogan_content"];
    _info.goods_gallery = [data objectForKey:@"goods_gallery"];
    
    _nameLabel.text = _info.goods_name;
    _jianJieLabel.text = _info.goods_brief;
    _NowPrice.text = _info.min_price;
    
    if ([_info.market_price isEqualToString:@""]) {
        _yuanPrice.text=@"";
    }
    else
    {
        _yuanPrice.text = [[NSString alloc] initWithFormat:@"原价: %@",_info.market_price];
    }
//    if ([_info.goods_sale_amount isEqualToString:@""]) {
//        _chengJiaoLiangLa.text=@"";
//    }
//    else
//    {
//        _chengJiaoLiangLa.text = [[NSString alloc] initWithFormat:@"销售量: %@",_info.goods_sale_amount];
//    }
    
    _guiGeArray = _info.goods_attrs;
    sheHeCheXingArray = _info.goods_car;
    
    AppDelegate *app=[AppDelegate shsharedeApp];
    [app.tabBarController hideCustomTabBar];
    scrollheight=448;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//        self.extendedLayoutIncludesOpaqueBars = NO;
//        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    self.navigationController.navigationBar.backgroundColor=[UIColor darkGrayColor];
    self.title=@"淘汽档口";
    
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
    
    _guiGeTable.delegate=self;
    _guiGeTable.dataSource=self;
    _guiGeTable.rowHeight=35.f;
    _guiGeTable.backgroundColor=[UIColor whiteColor];
    _guiGeTable.separatorColor=[UIColor darkGrayColor];
    _guiGeTable.scrollEnabled=NO;
    [_guiGeTable reloadData];
    [self guiGeTableData];
    
    _detailedTable.frame=CGRectMake(15, scrollheight, 290, 120);
    _detailedTable.dataSource=self;
    _detailedTable.delegate=self;
    _detailedTable.rowHeight=40.f;
    _detailedTable.scrollEnabled=NO;
    _detailedTable.backgroundColor=[UIColor clearColor];
    infoArray=[[NSArray alloc]initWithObjects:@"适用车型",_info.service_after_title,_info.slogan_title, nil];
    [_detailedTable reloadData];
    scrollheight=scrollheight+_detailedTable.frame.size.height+10;
    
    //    _butView.frame=CGRectMake(0, scrollheight, 320, 45);
    //    butViewY=_butView.frame.origin.y;
    //    scrollheight=scrollheight+_butView.frame.size.height;
    _contenrBack.frame=CGRectMake(0, 0, 320, scrollheight);
    BackY=_contenrBack.frame.origin.y;
    
    [_ContenrScroll setContentSize:CGSizeMake(320,scrollheight+100)];
    [_ContenrScroll addSubview:_imageView];
    [_ContenrScroll addSubview:_infoView];
    [_ContenrScroll addSubview:_guiGeView];
    [_ContenrScroll addSubview:_detailedTable];
    
    float height=[[UIScreen mainScreen] bounds].size.height;
    _butView.frame=CGRectMake(0, height-45-45-20, 320, 45);
    [self.view addSubview:_butView];

}
- (void) didGoodsInfoDataFailed : (NSString *)err
{
    NSLog(@"didGoodsInfoDataFailed");

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_pid) {
        _goodInfoFunc = [[goodInfoDetailFunc alloc] init];
        _goodInfoFunc.delegate = self;
        [_goodInfoFunc getGoodInfoDetail:_pid];
    }
    else if(_barcode)
    {
        _barcode = @"6Q02010511";
        _searchfunc = [[searchFunc alloc] init];
        _searchfunc.delegateBarcode = self;
        [_searchfunc getSearchBarcode:_barcode];
    }

    
}

- (void) didSearchGoodsByBarCodeDataSuccess : (id)data
{
    [self didGoodsInfoDataFailed:data];
}

- (void) didSearchGoodsByBarCodeDataFailed : (NSString *)err
{
}

//规格的frame
-(void)guiGeTableData{
    _guiGeTable.frame=CGRectMake(15, 40, 290, [_guiGeArray count]*35);
    _guiGeView.frame=CGRectMake(0, 448, 320, _guiGeTable.frame.origin.y+_guiGeTable.frame.size.height);
    scrollheight=scrollheight+_guiGeView.frame.size.height+17;
}

-(void)detailedTableFrame:(NSInteger)row{
    AdditionHeight=row*40;
    _detailedTable.frame=CGRectMake(15, _detailedTable.frame.origin.y, 290, 120+AdditionHeight);
    //_butView.frame=CGRectMake(0, butViewY+AdditionHeight, 320, 45);
    _contenrBack.frame=CGRectMake(0, 0, 320, BackY+AdditionHeight);
    [_ContenrScroll setContentSize:CGSizeMake(320, scrollheight+100+AdditionHeight)];
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
//左图片按钮
-(IBAction)clickLeftImageBT:(id)sender{

}
//右图片按钮
-(IBAction)clickRightImageBT:(id)sender{

}
//降价通知
-(IBAction)clickjianJiaBT:(id)sender{
    JiangJiaTongZhiViewController *jiangJiaVC=[[JiangJiaTongZhiViewController alloc]initWithNibName:@"JiangJiaTongZhiViewController" bundle:nil];
    [self.navigationController pushViewController:jiangJiaVC animated:YES];
}
//减数量
-(IBAction)clickJianNumBT:(id)sender{

}
//加数量
-(IBAction)clickJiaNumBT:(id)sender{

}
//立即购买
-(IBAction)clickGouMaiBT:(id)sender{

}
//加入购物车
-(IBAction)clickJoinShoppingCartBT:(id)sender{

}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag==INFORMATIONTABLE_TAG) {
        return [infoArray count];
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==INFORMATIONTABLE_TAG) {
        if (self.isOpen) {
            if (self.selectIndex.section == section) {
                return [sheHeCheXingArray count]+1;;
            }
        }
        return 1;
    }
    if (tableView.tag==SPECIFICATIONTABLE_TAG) {
        return [_guiGeArray count];
    }
    return 0;
}

//- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 40;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==INFORMATIONTABLE_TAG) {
        if (self.isOpen&&self.selectIndex.section == indexPath.section&&indexPath.row!=0) {
            static NSString *CellIdentifier = @"Cell2";
            Cell2 *cell = (Cell2*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
            }
//            NSArray *list = [infoArray objectAtIndex:self.selectIndex.section] ;
//            NSLog(@"%d",list.count);
            cell.titleLabel.text = [sheHeCheXingArray objectAtIndex:indexPath.row-1];
            return cell;
        }else
        {
            static NSString *CellIdentifier = @"Cell1";
            Cell1 *cell = (Cell1*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
            }
            NSString *name = [infoArray objectAtIndex:indexPath.section] ;
            cell.titleLabel.text = name;
            cell.textLabel.font=[UIFont systemFontOfSize:14];
            cell.textLabel.textColor=[UIColor darkGrayColor];
            [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath]?YES:NO)];
            return cell;
        }
    }
    if (tableView.tag==SPECIFICATIONTABLE_TAG) {
        static NSString *CellIdentifier = @"NovelRankTableViewCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UILabel *canShuLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 60, 20)];
            canShuLabel.backgroundColor=[UIColor clearColor];
            canShuLabel.textColor=[UIColor lightGrayColor];
            canShuLabel.font=[UIFont systemFontOfSize:14.0f];
//            canShuLabel.text=@"商品编码";
            canShuLabel.tag=1;
            [cell addSubview:canShuLabel];
            
            UILabel *canShuZhi=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 200, 20)];
            canShuZhi.tag=2;
            canShuZhi.backgroundColor=[UIColor clearColor];
            canShuZhi.textColor=[UIColor darkGrayColor];
            canShuZhi.font=[UIFont systemFontOfSize:14.0f];
//            canShuZhi.text=@"e120f700002";
            [cell addSubview:canShuZhi];
        }
        UILabel *canshu=(UILabel *)[cell viewWithTag:1];
        
        goodsAttr *attr = [_guiGeArray objectAtIndex:indexPath.row];
        
        canshu.text = attr.attr_name;
        UILabel *canshuzhi=(UILabel *)[cell viewWithTag:2];
        canshuzhi.text=attr.attr_value;
        return cell;
    }
    return nil;
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==INFORMATIONTABLE_TAG) {
        if (indexPath.row == 0) {
            if ([indexPath isEqual:self.selectIndex]) {
                self.isOpen = NO;
                [self didSelectCellRowFirstDo:NO nextDo:NO];
                self.selectIndex = nil;
                
            }else
            {
                if (!self.selectIndex) {
                    self.selectIndex = indexPath;
                    [self didSelectCellRowFirstDo:YES nextDo:NO];
                }else
                {
                    [self didSelectCellRowFirstDo:NO nextDo:YES];
                }
            }
            
        }else
        {
            
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
}


- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    Cell1 *cell = (Cell1 *)[_detailedTable cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    [_detailedTable beginUpdates];
    
    int section = self.selectIndex.section;
    int contentCount = [sheHeCheXingArray count];
    if (self.isOpen) {
        [self detailedTableFrame:contentCount];
    }else{
        [self detailedTableFrame:0];
    }
    
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [_detailedTable insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [_detailedTable deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	[_detailedTable endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [_detailedTable indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    if (self.isOpen) [_detailedTable scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}













- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

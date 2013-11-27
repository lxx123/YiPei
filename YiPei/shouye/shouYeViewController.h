//
//  shouYeViewController.h
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataProcessProtocol.h"

@class todayDiscountFunc;
@class todayNew;
@class todayDiscountGoods;

@interface shouYeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,dataTodayDiscountProcessProtocol>
{
    todayDiscountFunc *todayDiscount;
    
    todayNew *todayNewData;
    NSArray *todayDisCount;
}
@property(nonatomic, retain) todayDiscountFunc *todayDiscount;
@property(nonatomic,strong) IBOutlet UITableView *tableview;
@property(nonatomic,strong) IBOutlet UIView *personalInfoView;
@property(nonatomic,strong) IBOutlet UIView *searchView;

@property(nonatomic,strong)IBOutlet UIView *shouyeView;
@property(nonatomic,strong)IBOutlet UIButton *shouyeBT;
@property(nonatomic,strong)IBOutlet UIImageView *shouyeImage;
@property(nonatomic,strong)IBOutlet UILabel *shouyeLabel;
@property(nonatomic,strong)IBOutlet UIImageView *shouyeArrow;

@property(nonatomic,strong)IBOutlet UIButton *useBT;
@property(nonatomic,strong)IBOutlet UILabel *useNameLabel;
@property(nonatomic,strong)IBOutlet UIImageView *useImage;
@property(nonatomic,strong)IBOutlet UIImageView *useArrow;

@property(nonatomic,strong)IBOutlet UIButton *cartBT;
@property(nonatomic,strong)IBOutlet UILabel *cartLabel;
@property(nonatomic,strong)IBOutlet UIImageView *cartArow;
@property(nonatomic,strong)IBOutlet UIImageView *cartImage;
@property(nonatomic,strong)IBOutlet UILabel *shoppingCartNumLabel;
@property(nonatomic,strong)IBOutlet UIView *shoppingCartView;

@property(nonatomic,strong)IBOutlet UIView *InfoView;
@property(nonatomic,strong)IBOutlet UIButton *payBT;
@property(nonatomic,strong)IBOutlet UILabel *payLabel;
@property(nonatomic,strong)IBOutlet UIImageView *payArow;
@property(nonatomic,strong)IBOutlet UIImageView *payImage;

@property(nonatomic,strong)IBOutlet UIButton *instructionsBT;
@property(nonatomic,strong)IBOutlet UILabel *instructionsLabel;
@property(nonatomic,strong)IBOutlet UIImageView *instructionsArow;
@property(nonatomic,strong)IBOutlet UIImageView *instructionsImage;

@property(nonatomic,strong)IBOutlet UIButton *contactBT;
@property(nonatomic,strong)IBOutlet UILabel *contactLabel;
@property(nonatomic,strong)IBOutlet UIImageView *contactArow;
@property(nonatomic,strong)IBOutlet UIImageView *contactImage;

@property(nonatomic,strong)IBOutlet UIButton *updateBT;
@property(nonatomic,strong)IBOutlet UILabel *updateLabel;
@property(nonatomic,strong)IBOutlet UIImageView *updateArow;
@property(nonatomic,strong)IBOutlet UIImageView *updateImage;

@property(nonatomic,strong)UIButton *leftitem;
@property(nonatomic,strong)UIButton *rightitem;

@property(nonatomic,strong) todayNew *todayNewData;
@property(nonatomic,strong) NSMutableArray *todayDisCountArray;

-(IBAction)clickSearchBT:(id)sender;

-(IBAction)clickToSweep:(id)sender;//扫一扫

-(void)clickPersonalInfoBT:(id)sender;

-(IBAction)clickShoppingCartBT:(id)sender;//购物车

-(IBAction)clickShouYeBT:(id)sender;

-(IBAction)clickUseNameBT:(id)sender;

-(IBAction)clickPaymentBT:(id)sender;

-(IBAction)clickInstructionsBt:(id)sender;//使用说明

-(IBAction)clickContactBT:(id)sender;//联系我们

-(IBAction)clickUpdateBT:(id)sender;//更新
//点击按钮视图的变化
-(void)updateview:(NSInteger)tag;


@end

//
//  JiangJiaTongZhiViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-11-25.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JiangJiaTongZhiViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic,strong)IBOutlet UILabel *PriceLabel;//比较价格
@property(nonatomic,strong)IBOutlet UITextField *caiGouPriceText;//采购价格
@property(nonatomic,strong)IBOutlet UITextField *caiGouNumber;//采购数量
@property(nonatomic,strong)IBOutlet UITextField *fanDian;//返点
@property(nonatomic,strong)IBOutlet UIView *paiZhaoV;
@property(nonatomic,strong)IBOutlet UIButton *paiZhaoBT;
@property(nonatomic,strong)IBOutlet UIView *zhaoPianV;
@property(nonatomic,strong)IBOutlet UIImageView *zhaoPian;

@property(nonatomic,strong)UIButton *leftitem;
@property(nonatomic,strong)UIButton *rightitem;
@end

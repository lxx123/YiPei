//
//  GuoWuCheViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuoWuCheViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)IBOutlet UITableView *tableview;
@property(nonatomic,strong)IBOutlet UIButton *quanXuanBT;
@property(nonatomic,strong)IBOutlet UILabel *zongJiaLabel;
@property(nonatomic,strong)IBOutlet UIButton *shanChuBT;
@property(nonatomic,strong)IBOutlet UIButton *jieSuanBT;

@property(nonatomic,strong)IBOutlet UIView *queDingView;
@property(nonatomic,strong)IBOutlet UIButton *JiaNum;
@property(nonatomic,strong)IBOutlet UIButton *JianNum;
@property(nonatomic,strong)IBOutlet UILabel *geShu;
@property(nonatomic,strong)IBOutlet UIButton *quexiaoBT;
@property(nonatomic,strong)IBOutlet UIButton *quDingBT;

@end

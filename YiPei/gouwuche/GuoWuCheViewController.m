//
//  GuoWuCheViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "GuoWuCheViewController.h"
#import "AppDelegate.h"
#import "CustomTabBar.h"
@interface GuoWuCheViewController (){
    int number;
    BOOL isQuanXuan;
    NSMutableDictionary *selectDictionary;
    

}

@end

@implementation GuoWuCheViewController
@synthesize tableview=_tableview;
@synthesize quanXuanBT=_quanXuanBT;
@synthesize infoView=_infoView;
@synthesize zongJiaLabel=_zongJiaLabel;
@synthesize shanChuBT=_shanChuBT;
@synthesize jieSuanBT=_jieSuanBT;
@synthesize queDingView=_queDingView;
@synthesize JiaNumBT=_JiaNumBT;
@synthesize JianNumBT=_JianNumBT;
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

- (void)viewWillAppear:(BOOL)animated{
    _queDingView.hidden=YES;
    number=1;
    isQuanXuan=YES;
    _geShu.text=[NSString stringWithFormat:@"%d",number];
     [_quanXuanBT setBackgroundImage:[UIImage imageNamed:@"cart_input_choose_press.png"] forState:UIControlStateNormal];
    for (int i=0; i<10; i++) {
        NSString *keyid=[NSString stringWithFormat:@"%d",i];
        [selectDictionary setObject:@"1" forKey:keyid];
    }
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
    self.title=@"购物车";
    AppDelegate *app=[AppDelegate shsharedeApp];
    [app.tabBarController hideCustomTabBar];
    
    _leftitem=[[UIButton alloc]initWithFrame:CGRectMake(20, 14, 50, 30)] ;
    _leftitem.backgroundColor=[UIColor clearColor];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back.png"] forState:UIControlStateNormal];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back_press.png"] forState:UIControlStateHighlighted];
    [_leftitem addTarget:self action:@selector(clickFanHuiBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_leftitem];

    float height=[[UIScreen mainScreen] bounds].size.height-20;
    _tableview.frame=CGRectMake(0, 35, 320, height-40-90);
    _infoView.frame=CGRectMake(0,height-90-40, 320, 90);
    
    _queDingView.hidden=YES;
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.backgroundColor=[UIColor clearColor];
    _tableview.separatorColor=[UIColor lightGrayColor];
    _tableview.rowHeight=125;
    selectDictionary=[[NSMutableDictionary alloc]init];
}


//返回
-(void)clickFanHuiBT:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    
}
//全选
-(IBAction)clickquanXuanBT:(id)sender{
    if (isQuanXuan) {
        isQuanXuan=NO;
        [_quanXuanBT setBackgroundImage:[UIImage imageNamed:@"cart_input_choose.png"] forState:UIControlStateNormal];
        for (int i=0; i<10; i++) {
            NSString *keyid=[NSString stringWithFormat:@"%d",i];
            [selectDictionary setObject:@"0" forKey:keyid];
        }
    }else{
        isQuanXuan=YES;
        [_quanXuanBT setBackgroundImage:[UIImage imageNamed:@"cart_input_choose_press.png"] forState:UIControlStateNormal];
        for (int i=0; i<10; i++) {
            NSString *keyid=[NSString stringWithFormat:@"%d",i];
            [selectDictionary setObject:@"1" forKey:keyid];
        }
    }
    [_tableview reloadData];
}

//删除
-(IBAction)clickshanChuBT:(id)sender{

}

//结算
-(IBAction)clickjieSuanBT:(id)sender{
    _queDingView.hidden=NO;

}

//加
-(IBAction)clickJiaNumBT:(id)sender{
    number=number+1;
    _geShu.text=[NSString stringWithFormat:@"%d",number];

}

//减
-(IBAction)clickJianNumBT:(id)sender{
    if (number==1) {
        _JianNumBT.userInteractionEnabled=NO;
        [_JianNumBT setBackgroundImage:[UIImage imageNamed:@"probtn_sub_disable.png"] forState:UIControlStateNormal];
        return;
    }
    [_JianNumBT setBackgroundImage:[UIImage imageNamed:@"probtn_sub.png"] forState:UIControlStateNormal];
    number=number-1;
    _geShu.text=[NSString stringWithFormat:@"%d",number];

}
//取消
-(IBAction)clickquexiaoBT:(id)sender{
_queDingView.hidden=YES;
}
//确定
-(IBAction)clickquDingBT:(id)sender{
_queDingView.hidden=YES;
}

//是否选中
-(void)selectShangping:(id)sender{
    UIButton *but=(UIButton *)sender;
    UITableViewCell* cell = (UITableViewCell* )but.superview.superview;
    NSIndexPath *index = [_tableview indexPathForCell:cell];
    NSString *str=[selectDictionary objectForKey:[NSString stringWithFormat:@"%d",index.row]];
    if ([str isEqualToString:@"1"]) {
         [selectDictionary setObject:@"0" forKey:[NSString stringWithFormat:@"%d",index.row]];
    }else{
         [selectDictionary setObject:@"1" forKey:[NSString stringWithFormat:@"%d",index.row]];
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
    UIView *spcell = [cell viewWithTag:1001];
    if (spcell==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"GuoWuCheCell" owner:self options:nil];
        spcell=[nib objectAtIndex:0];
        spcell.backgroundColor=[UIColor clearColor];
        [cell addSubview:spcell];
    }
    //UIImageView *imgeview=(UIImageView *)[spcell viewWithTag:1];
    
    
    UILabel *NameLa=(UILabel *)[spcell viewWithTag:2];
    NameLa.text=@"MANN 空气滤清器";
    
    UIButton *button=(UIButton *)[spcell viewWithTag:3];
    [button addTarget:self action:@selector(selectShangping:) forControlEvents:UIControlEventTouchUpInside];
    if ([[selectDictionary objectForKey:[NSString stringWithFormat:@"%d",indexPath.row]] isEqualToString:@"1"]) {
        [button setBackgroundImage:[UIImage imageNamed:@"cart_input_choose_press.png"] forState:UIControlStateNormal];
    }else{
        [button setBackgroundImage:[UIImage imageNamed:@"cart_input_choose.png"] forState:UIControlStateNormal];
    }

    UILabel *xingHaoLa=(UILabel *)[spcell viewWithTag:4];
    xingHaoLa.text=@"美孚（ow-40）sn 1l装";
    
    UILabel *danjiaLa=(UILabel *)[spcell viewWithTag:5];
    danjiaLa.text=@"¥120.00";
    
    UILabel *zongjiaLa=(UILabel *)[spcell viewWithTag:6];
    zongjiaLa.text=@"120.00";
    
    UILabel *numberLa=(UILabel *)[spcell viewWithTag:7];
    numberLa.text=[NSString stringWithFormat:@"1"];
    return cell ;
}










- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

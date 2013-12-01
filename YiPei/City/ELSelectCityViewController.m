//
//  ELSelectCityViewController.m
//  ELIFE
//
//  Created by lixiao on 13-4-23.
//  Copyright (c) 2013年 lixiao. All rights reserved.
//
#import "allConfig.h"
#import "model.h"
#import "AppDelegate.h"
#import "ELSelectCityViewController.h"
#import "citySiteFunc.h"
#import "userInfo.h"

#import "userDataManager.h"

#define EL_FONT_NAME @"Arial"
#define EL_FONT_SIZE 15.0
#define EL_COMMON_COLOR_NAME ([UIColor blackColor])


@interface ELSelectCityViewController ()
@property(nonatomic,strong)UIButton *eLeftNavBtn;
@end

@implementation ELSelectCityViewController
@synthesize eCitytab=_eCitytab;
@synthesize eCityList=_eCityList;
@synthesize eLeftNavBtn=_eLeftNavBtn;
//@synthesize eCityletter=_eCityletter;
@synthesize eCityitemarray=_eCityitemarray;
@synthesize eCityOrientation=_eCityOrientation;
@synthesize eCityPinyin=_eCityPinyin;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillDisappear:(BOOL)animated{
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:HxzChkNetSuccessNotification object:nil];
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:HxzChkNetFailNotification object:nil];
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:HxzChkNetViaWWANNotification object:nil];
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:HxzChkNetViaWiFiNotification object:nil];
}



- (void)viewWillAppear:(BOOL)animated{
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"bringCustomTabBarToFront" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hxzLoadHomeNetData) name:HxzChkNetSuccessNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hxzCloseFirstViewCallback) name:HxzChkNetFailNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hxzChkNetViaWWAN) name:HxzChkNetViaWWANNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hxzChkNetViaWiFi) name:HxzChkNetViaWiFiNotification object:nil];
//    [[NetCheck getShareNetCheck] startChkNetwork];
//    
}

//网络链接成功
-(void)hxzLoadHomeNetData{
//    [_eCityList startQueryData:@"" CityType:CITYTITLE];
}

//网络链接失败
-(void)hxzCloseFirstViewCallback{
//    __autoreleasing UIAlertView *aler=[[UIAlertView alloc]initWithTitle:NoNetworkTitle
//                                                                message:NoNetworkContent
//                                                               delegate:nil
//                                                      cancelButtonTitle:@"确定"
//                                                      otherButtonTitles:nil,nil];
//    [aler show];
}

-(void)hxzChkNetViaWWAN{
    
}

-(void)hxzChkNetViaWiFi{
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
//    if ([ELLifeViewController sharedeLifeVC].eCityName) {
//        self.title=[NSString stringWithFormat:@"当前城市:%@",[ELLifeViewController sharedeLifeVC].eCityName];
//    }else{
        self.title=[NSString stringWithFormat:@"选择城市"];
//    }
    
    _eCityOrientation=[[ELCityOrientation alloc]init];
    _eCityOrientation.delegate=self;
    [_eCityOrientation UpdatingLocation];
    
    _eLeftNavBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)] ;
    _eLeftNavBtn.backgroundColor=[UIColor clearColor];
    [_eLeftNavBtn setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [_eLeftNavBtn setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateHighlighted];
    [_eLeftNavBtn addTarget:self action:@selector(leftBarBtnPress) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_eLeftNavBtn];
    
    _eCitytab=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, __MainScreen_Width, __MainScreen_Height-50)];
    _eCitytab.backgroundColor=[UIColor clearColor];
    _eCitytab.rowHeight=40;
    _eCitytab.dataSource=self;
    _eCitytab.delegate=self;
    [self.view addSubview:_eCitytab];
    
}

-(void)SwitchCity
{
    _eCityList=[[citySiteFunc alloc]init];
    _eCityList.delegate=self;
    [_eCityList getCitySite];
}

/**
 *城市获取数据完成
 */


- (void) didCitySiteDataSuccess : (id)data
{
    _eCityitemarray = data;
    
    [_eCitytab reloadData];
}
- (void) didCitySiteDataFailed : (NSString *)err
{
}

/**
 *定位城市获取数据完成
 */
- (void)CityOrientationDataDidFinish:(ELCityOrientation *)engine CityName:(NSString *)cityname{
    NSLog(@"cityname=%@",cityname);
    if (cityname) {
        _eCityPinyin=cityname;
//        [_eCitylite startQueryData:@"" CityType:CITYTITLE];
    }else{
        _eCityPinyin = @"";

    }
    [self SwitchCity];
}

/**
 *定位城市失败
 */
- (void)CityOrientationError:(ELCityOrientation *)engine  Error:(NSString *)error{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Location"
                                                       message:error delegate:self cancelButtonTitle:@"Ok"otherButtonTitles:nil, nil];
    [alertView show];
    _eCityPinyin = @"";
    [self SwitchCity];
}

-(void)leftBarBtnPress{
//    if ([ELLifeViewController sharedeLifeVC].eCityName) {
//        [self.navigationController popViewControllerAnimated:YES];
//    }
}







#pragma mark -
#pragma mark UITableViewataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([_eCityPinyin isEqualToString:@""])
        return 1;
    else
        return 2;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section
{
    if(aTableView.numberOfSections  == 1){
        return  [_eCityitemarray count];
    }
    else
    {
        if (section == 0) {
            if ([_eCityPinyin isEqualToString:@""]) {
                return 0;
            }
            else
            {
                return  1;
            }
        }
        else if(section == 1)
        {
            return  [_eCityitemarray count];
        }
    }
    
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *sectionHeader;
    if(tableView.numberOfSections  == 1){
        sectionHeader = @"请选择已经开通的城市";
    }
    else
    {
        if (section == 0) {
            sectionHeader = @"当前城市";
        }
        else if(section == 1)
        {
            sectionHeader = @"请选择已经开通的城市";
        }

    }
    return sectionHeader;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *CellIdentifier;
    CellIdentifier=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];

        UILabel *cityname=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 200, 25)];
        cityname.tag=0x12;
        cityname.backgroundColor=[UIColor clearColor];
        cityname.font=[UIFont fontWithName:EL_FONT_NAME size:EL_FONT_SIZE];
        cityname.textColor=EL_COMMON_COLOR_NAME;
        [cell addSubview:cityname];
        
    }
    UILabel *cityname=(UILabel *)[cell viewWithTag:0x12];
    if(tableView.numberOfSections  == 1){
        NSDictionary *city = [_eCityitemarray objectAtIndex:indexPath.row];
        cityname.text = [city objectForKey:@"region_name"];
    }
    else
    {
        if (indexPath.section == 0) {
            cityname.text=_eCityPinyin;
        }
        else if(indexPath.section==1)
        {
            NSDictionary *city = [_eCityitemarray objectAtIndex:indexPath.row];
            cityname.text = [city objectForKey:@"region_name"];
        }
    }
    return cell;
}

#pragma mark -
#pragma mark TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self.navigationController popViewControllerAnimated:YES];

    userInfo *userdb = [[userInfo alloc] init];
    if(tableView.numberOfSections  == 1){
        NSDictionary *city = [_eCityitemarray objectAtIndex:indexPath.row];
        [userdb addCityInfo:[city objectForKey:@"region_id"] cityName:[city objectForKey:@"region_name"]];
        [[AppDelegate shsharedeApp] citySelected];
        [userDataManager sharedUserDataManager].cityID = [city objectForKey:@"region_id"];
        [userDataManager sharedUserDataManager].cityName = [city objectForKey:@"region_name"];
    }
    else
    {
        if (indexPath.section == 0) {
            NSString *cid = nil;
            for (NSDictionary *dic in _eCityitemarray) {
                if ([_eCityPinyin isEqualToString:[dic objectForKey:@"region_name"]]) {
                    cid = [dic objectForKey:@"region_id"];
                }
            }
            if (cid) {
                [userdb addCityInfo:cid cityName:_eCityPinyin];
                [[AppDelegate shsharedeApp] citySelected];
                [userDataManager sharedUserDataManager].cityID = cid;
                [userDataManager sharedUserDataManager].cityName = _eCityPinyin;
            }
            else
            {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"错误"
                                                                   message:@"该城市尚未开通服务" delegate:self cancelButtonTitle:@"Ok"otherButtonTitles:nil, nil];
                [alertView show];
                
            }
        }
        else if(indexPath.section==1)
        {
            NSDictionary *city = [_eCityitemarray objectAtIndex:indexPath.row];
//            [userdb addCityInfo:[city objectForKey:@"region_id"] cityName:[city objectForKey:@"region_name"]];
            [[AppDelegate shsharedeApp] citySelected];
            [userDataManager sharedUserDataManager].cityID = [city objectForKey:@"region_id"];
            [userDataManager sharedUserDataManager].cityName = [city objectForKey:@"region_name"];
        }
    }
}

////构造
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    return _eCityletter;
//
//}
//
//-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
////    NSIndexPath * pa = [NSIndexPath indexPathForRow:0 inSection:index];
////    [_eCitytab scrollToRowAtIndexPath:pa
////                     atScrollPosition:UITableViewScrollPositionTop animated:NO];
//    return index;
//    
//}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

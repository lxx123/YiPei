//
//  CarSortWithNameListViewController.m
//  YiPei
//
//  Created by daichuanning on 13-12-1.
//  Copyright (c) 2013年 lee. All rights reserved.
//



@interface SortNameListModel:NSString
@property(nonatomic, strong)NSString * name;
@property(nonatomic, strong)NSString * onSale;

@property(nonatomic, strong)NSString * value;

@end


@implementation SortNameListModel

@synthesize name = _name;
@synthesize onSale = _onSale;
@synthesize value = _value;

@end



@interface SortModel : NSString
@property(nonatomic, strong)NSString * name;


@end


@implementation SortModel

@synthesize name = _name;


@end

#import "CarSortWithNameListViewController.h"
#import "CarSortWithNameViewController.h"
#import "UINavigationView.h"
#import  "CarSortWithNameViewController.h"
@interface CarSortWithNameListViewController ()

@property(nonatomic,strong) IBOutlet UINavigationView * headNav;
@end

@implementation CarSortWithNameListViewController


@synthesize sortWithNameListTableView = _sortWithNameListTableView;
@synthesize smallTableView = _smallTableView;
@synthesize sortButton = _sortButton;
@synthesize filterButton = _filterButton;


@synthesize blckView = _blckView;


@synthesize headNav = _headNav;



#define MAINVIEW_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define MAINVIEW_WIDTH [[UIScreen mainScreen]bounds].size.width

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
    
    sortWithNameListArray = [[NSMutableArray alloc] init];
    
    
    SortNameListModel * model = [[SortNameListModel alloc ] init ];
    
    model.name = @"世博";
    model.onSale = @"世博1";
    model.value = @"100";
    [sortWithNameListArray addObject:model];
   
    _smallTableView.delegate = self;
    [_sortWithNameListTableView reloadData];
    _sortWithNameListTableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];
    
    _smallTableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];
    
   [self initLeftBarButtonItem];
     
     
    
}


-(void)initLeftBarButtonItem{
    
    [_headNav initWithLeftBarItemWithTitle:@"" withFrame:CGRectMake(10, 7, 50, 30)  withAction:@selector(backToFeileiView) withButtonImage:[UIImage imageNamed:@"topbtn_back_press.png"] withHighlighted:nil withTarget:self];
    
    //    UIButton * leftButton = [[UIButton alloc] init];
    //    leftButton.frame = CGRectMake(10,7, 50, 30);
    //
    //    [leftButton setBackgroundImage:[UIImage imageNamed:@"topbtn_back_press.png"] forState:UIControlStateNormal];
    //    [leftButton addTarget:self action:@selector(backToFeileiView) forControlEvents:UIControlEventTouchDown];
    //    UIBarButtonItem * leftBarItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton ];
    //
    //
    //
    //    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}
-(void)backToFeileiView{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)sortClick:(id)sender{
    if (!isSort ) {
        isSort = YES;
        //        isFilter = YES;
        smallTableArray = [[NSMutableArray alloc] init];
        
        SortModel * sortModel = [[SortModel alloc] init];
        sortModel.name = @"价格";
        [smallTableArray addObject:sortModel];
       
        [self setBlckViewAndSmarllTable:smallTableArray.count];
        
    }else if(isSort ){
        [self removeBlckViewAndSmarllTable];
        isSort = NO;
    }
    
    
}
-(void)setBlckViewAndSmarllTable:(NSInteger)count{
    
    _blckView.frame = CGRectMake(0, 74, 320, MAINVIEW_HEIGHT-74);
    [self.view addSubview:_blckView];
    _smallTableView.frame = CGRectMake(0, 74, 320, count * 44);
    [self.view addSubview:_smallTableView];
    [_smallTableView reloadData];
}
-(void)removeBlckViewAndSmarllTable{
    if ([self.view.subviews containsObject:_blckView]) {
        [_blckView removeFromSuperview];
    }
    if ([self.view.subviews containsObject:_smallTableView]) {
        [_smallTableView removeFromSuperview];
    }
}
-(void)loadSortData{
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    
    //    self.navigationController.navigationBarHidden = NO;
}
-(IBAction)filterClick:(id)sender{
    CarSortWithNameViewController * sortNameView = [[CarSortWithNameViewController alloc] init];
    [self removeBlckViewAndSmarllTable];
    isSort = NO;
    [self.navigationController pushViewController:sortNameView animated:YES];
}
-(void)loadFilterData{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_sortWithNameListTableView==tableView) {
        return 64;
    }else
        return 44;
    
}
//返回有多少个TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//
//    return @"今日";
//}
//返回TableView中有多少数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    return [fenLeiDataArray count];
    if (tableView==_sortWithNameListTableView) {
        return [sortWithNameListArray count];
    }
    return [smallTableArray count];
    //    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_sortWithNameListTableView) {
        static NSString *CellIdentifier = @"CellIdentifier";
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.backgroundColor = [UIColor whiteColor];
            imageView.frame = CGRectMake(10, 8, 48, 48);
            imageView.tag = 0x1;
            [cell addSubview:imageView];
            
            UILabel * lab;
            
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(68, 2, 250, 30);
            lab.backgroundColor = [UIColor clearColor];
            lab.tag = 0x2;
            [cell addSubview:lab];
            
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(68, 35, 150, 25);
            lab.backgroundColor = [UIColor clearColor];
            lab.tag = 0x3;
            lab.font = [UIFont systemFontOfSize:14.0];
            lab.textColor = [UIColor colorWithRed:98/255.0 green:98/255.0 blue:98/255.0 alpha:1.0];
            
            [cell addSubview:lab];
            
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(228, 32, 180, 30);
            lab.backgroundColor = [UIColor clearColor];
            lab.tag = 0x4;
            
            lab.textColor = [UIColor colorWithRed:187/255.0 green:54/255.0 blue:60/255.0 alpha:1.0];
            
            [cell addSubview:lab];
            
        }
        
        SortNameListModel * model = [sortWithNameListArray objectAtIndex:indexPath.row];
        
        UIImageView * imageV = (UIImageView*)[cell viewWithTag:0x1];
        UILabel * nameLab = (UILabel *)[cell viewWithTag:0x2];
        UILabel * onSaleLab = (UILabel *)[cell viewWithTag:0x3];
        UILabel * valueLab = (UILabel *)[cell viewWithTag:0x4];
        
        NSString * valueSt = [NSString stringWithFormat:@"¥%@",model.value];
        imageV.image = [UIImage imageNamed:@""];
        nameLab.text = model.name;
        
        onSaleLab.text = model.onSale;
        valueLab.text = valueSt;
        
        return cell;
    }
    else{
        static NSString *CellIdentifier1 = @"CellIdentifier1";
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
            
            
            UILabel * lab;
            
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(60, 7, 250, 30);
            lab.backgroundColor = [UIColor clearColor];
            lab.tag = 0x1;
            lab.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
            
            [cell addSubview:lab];
            
            
        }
        
        SortModel * model = [smallTableArray objectAtIndex:indexPath.row];
        
        
        UILabel * nameLab = (UILabel *)[cell viewWithTag:0x1];
        NSLog(@"nameLab.text==%@",nameLab.text);
        
        nameLab.text = model.name;
        
        return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_smallTableView == tableView) {
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

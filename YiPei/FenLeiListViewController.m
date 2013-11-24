//
//  FenLeiListViewController.m
//  YiPei
//
//  Created by daichuanning on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//


@interface FenLeiListModel : NSString
@property(nonatomic, strong)NSString * name;
@property(nonatomic, strong)NSString * onSale;

@property(nonatomic, strong)NSString * value;

@end


@implementation FenLeiListModel

@synthesize name = _name;
@synthesize onSale = _onSale;
@synthesize value = _value;

@end



@interface FenLeiListSortModel : NSString
@property(nonatomic, strong)NSString * name;


@end


@implementation FenLeiListSortModel

@synthesize name = _name;


@end


#import "FenLeiListViewController.h"


#define MAINVIEW_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define MAINVIEW_WIDTH [[UIScreen mainScreen]bounds].size.width

@interface FenLeiListViewController ()

@end

@implementation FenLeiListViewController


@synthesize fenLeiListTableView = _fenLeiListTableView;
@synthesize sortButton = _sortButton;
@synthesize filterButton = _filterButton;


@synthesize blckView = _blckView;


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
    fenLeiListArray = [[NSMutableArray alloc] init];
    FenLeiListModel * model = [[FenLeiListModel alloc ] init ];
    
   
   model.name = @"世博";
    model.onSale = @"世博1";
    model.value = @"100";
    [fenLeiListArray addObject:model];
    
    [_fenLeiListTableView reloadData];
    _fenLeiListTableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];
    _smallTableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];

    
}

-(IBAction)sortClick:(id)sender{
    if (!isSort && !isFilter) {
        isSort = YES;
//        isFilter = YES;
        smallTableArray = [[NSMutableArray alloc] init];
        FenLeiListSortModel * sortModel = [[FenLeiListSortModel alloc] init];
        sortModel.name = @"价格";
        [smallTableArray addObject:sortModel];
        
        [self setBlckViewAndSmarllTable:smallTableArray.count];
        
    }else if (!isSort && isFilter) {//说明筛选 按钮已经点击
        [self removeBlckViewAndSmarllTable];
        
        [self setBlckViewAndSmarllTable:smallTableArray.count];
        isFilter = NO;
        isSort = YES;
        
    }else if (isSort && !isFilter){
        [self removeBlckViewAndSmarllTable];
        isSort = NO;
        isFilter = NO;
    }
    else{
        isSort = NO;
//        isFilter = NO;
        
        [self removeBlckViewAndSmarllTable];
    }
    
}
-(void)setBlckViewAndSmarllTable:(NSInteger)count{
    
    _blckView.frame = CGRectMake(0, 30, 320, MAINVIEW_HEIGHT-30);
    [self.view addSubview:_blckView];
    _smallTableView.frame = CGRectMake(0, 30, 320, count * 44);
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

-(IBAction)filterClick:(id)sender{
    if (!isFilter &&!isSort) {
//        isSort = YES;
        isFilter = YES;
        
        smallTableArray = [[NSMutableArray alloc] init];
        FenLeiListSortModel * sortModel = [[FenLeiListSortModel alloc] init];
        sortModel.name = @"价格";
        [smallTableArray addObject:sortModel];
        
        [self setBlckViewAndSmarllTable:smallTableArray.count];
    }else if (isSort && !isFilter) {
        [self removeBlckViewAndSmarllTable];
        
        [self setBlckViewAndSmarllTable:smallTableArray.count];
        isSort = NO;
        isFilter = YES;
    }else if (!isSort && isFilter){
          [self removeBlckViewAndSmarllTable];
        isSort = NO;
        isFilter = NO;
    }
    else{
        isSort = NO;
        isFilter = NO;
        [self removeBlckViewAndSmarllTable];
    }
}
-(void)loadFilterData{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_fenLeiListTableView==tableView) {
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
    if (tableView==_fenLeiListTableView) {
        return [fenLeiListArray count];
    }
    return [smallTableArray count];
    //    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_fenLeiListTableView) {
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
        FenLeiListModel * model = [fenLeiListArray objectAtIndex:indexPath.row];
        
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
//        FenLeiListModel * model = [fenLeiListArray objectAtIndex:indexPath.row];
        
    
        UILabel * nameLab = (UILabel *)[cell viewWithTag:0x1];
    
//        nameLab.text = model.name;
        
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

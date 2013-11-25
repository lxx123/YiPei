//
//  fenLeiViewController.m
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "fenLeiViewController.h"

#import "FenLeiListViewController.h"

#import "GuolvViewController.h"

#import "FenLeiCell.h"
#import "FenLeiCell2.h"
@interface fenLeiViewController ()
@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;



//kdjjkdjgkfj
@end

@implementation fenLeiViewController


@synthesize isOpen = _isOpen;
@synthesize selectIndex = _selectIndex;

@synthesize fenLeiTableView = _fenLeiTableView;
@synthesize fenLeiDataArray = _fenLeiDataArray;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:nil tag:1];
//        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"menu_class_press.png"]
//             withFinishedUnselectedImage:[UIImage imageNamed:@"menu_class.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initLeftBarButtonItem];
    [self initRightBarButtonItem];
   
    
    self.isOpen = NO;
    
    _fenLeiDataArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;
    NSMutableArray  * arry;
    
    arry = [[NSMutableArray alloc] initWithObjects: nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"全部分类" forKey:@"name"];
    
    [dic setValue:arry forKey:@"0"];
    [_fenLeiDataArray addObject:dic];
    
    arry = [[NSMutableArray alloc] initWithObjects:@"11",@"12",@"13", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:arry forKey:@"1"];
    [dic setValue:@"第一" forKey:@"name"];
    [_fenLeiDataArray addObject:dic];
    
    arry = [[NSMutableArray alloc] initWithObjects:@"21",@"22",@"23", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"第二" forKey:@"name"];

    [dic setValue:arry forKey:@"2"];
    [_fenLeiDataArray addObject:dic];
    
    arry = [[NSMutableArray alloc] initWithObjects:@"31",@"32",@"33", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"第三" forKey:@"name"];

    [dic setValue:arry forKey:@"3"];
    [_fenLeiDataArray addObject:dic];
    
    arry = [[NSMutableArray alloc] initWithObjects:@"41",@"42",@"43", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"第四" forKey:@"name"];

    [dic setValue:arry forKey:@"4"];
    [_fenLeiDataArray addObject:dic];
    
     [_fenLeiTableView reloadData];
    _fenLeiTableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];

}
-(void)initLeftBarButtonItem{
    UIButton * leftButton = [[UIButton alloc] init];
    leftButton.frame = CGRectMake(10,7, 30, 30);

    [leftButton setBackgroundImage:[UIImage imageNamed:@"btn_car.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBarItemClick) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem * leftBarItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton ];
   
   
    
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}
-(void)leftBarItemClick{
}
-(void)initRightBarButtonItem{

    
    UIButton * rightButton = [[UIButton alloc] init];
    rightButton.frame = CGRectMake(280,7, 30, 30);
    
    [rightButton setBackgroundImage:[UIImage imageNamed:@"topbtn_cart.png"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBarItemClick) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem * rightBarItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton ];
    
    
    
    self.navigationItem.rightBarButtonItem = rightBarItem;

}
-(void)rightBarItemClick{
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section==0) {
//        NSString * str = [NSString stringWithFormat:@"%i",section];
        NSMutableDictionary * dic = [_fenLeiDataArray objectAtIndex:section];
        return [dic objectForKey:@"name"];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isOpen) {
        if (self.selectIndex.section == indexPath.section) {
            if(indexPath.row==0){
                return 64;
            }
            return 45;;
        }
    }
    
    return 64;
}
//返回有多少个TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   return [_fenLeiDataArray count]-1;//第零个不显示
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return [fenLeiDataArray count];
    if (self.isOpen) {
        if (self.selectIndex.section == section) {
            NSString * rowStr = [NSString stringWithFormat:@"%i",section+1];
            NSMutableDictionary * dic = [_fenLeiDataArray objectAtIndex:section+1];
            NSMutableArray * array = [dic objectForKey:rowStr];
            return [array count]+1;;
        }
    }
    return 1;
//    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isOpen&&self.selectIndex.section == indexPath.section&&indexPath.row!=0) {
        static NSString *CellIdentifier = @"Cell2";
        FenLeiCell2 *cell = (FenLeiCell2*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
            UIImageView * backIamge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteColor.png"]];
            cell.backgroundView = backIamge;
           
        }
        NSString * str = [NSString stringWithFormat:@"%i",indexPath.section+1];
        NSMutableDictionary * dic = [_fenLeiDataArray objectAtIndex:indexPath.section+1];
//         [cell cellBackgroundColor ];

        NSArray *list = [dic objectForKey:str];
     
        
        cell.titleLabel.text = [list objectAtIndex:indexPath.row-1];
        cell.titleLabel.textColor = [UIColor colorWithRed:129/255.0 green:129/255.0 blue:129/255.0 alpha:1.0];
        return cell;
    }else
    {
        static NSString *CellIdentifier = @"Cell1";
        FenLeiCell *cell = (FenLeiCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
        }
//        cell.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        if (indexPath.row==0) {
            cell.frame = CGRectMake(0, 0, 0, 0);
        }
        
//        NSString * str = [NSString stringWithFormat:@"%i",indexPath.row+1];//应为第零个不显示

        NSMutableDictionary * dic = [_fenLeiDataArray objectAtIndex:indexPath.section+1];
    
        
//        NSMutableArray * array = [[_fenLeiDataArray objectAtIndex:indexPath.section] objectForKey:str];
//        NSLog(@"array=%@",array);

        NSString *name = [dic objectForKey:@"name"];
        cell.titleLabel.text = name;
        cell.titleLabel.textColor = [UIColor colorWithRed:129/255.0 green:129/255.0 blue:129/255.0 alpha:1.0];
        UIImage * image =[UIImage imageNamed:@"bg_brand_hot.png"];
       
        
        [cell showImage:image];
        [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath]?YES:NO)];
        return cell;
    }
}


#pragma mark - Table view delegate
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        if ([indexPath isEqual:self.selectIndex]) {
            self.isOpen = NO;
            [self didSelectCellRowFirstDo:NO   nextDo:NO];
            self.selectIndex = nil;
            
        }else
        {
            if (!self.selectIndex) {
                self.selectIndex = indexPath;
                [self didSelectCellRowFirstDo:YES  nextDo:NO];
                
            }else
            {
                
                [self didSelectCellRowFirstDo:NO  nextDo:YES];
            }
        }
        
    }else
    {
//        dd 
//        NSDictionary *dic = [_fenLeiDataArray objectAtIndex:indexPath.section];
//        NSArray *list = [dic objectForKey:@"name"];
//        NSString *item = [list objectAtIndex:indexPath.row-1];
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:item message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil];
//        [alert show];
        GuolvViewController * viewC = [[GuolvViewController alloc] init];
        
        FenLeiListViewController * listView = [[FenLeiListViewController alloc] init];
        [self.navigationController pushViewController:listView animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert  nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    
    FenLeiCell *cell = (FenLeiCell *)[_fenLeiTableView cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    
    [_fenLeiTableView beginUpdates];
    
    int section = self.selectIndex.section;
    NSString * str = [NSString stringWithFormat:@"%i",self.selectIndex.section +1];
    NSMutableDictionary * dic =[_fenLeiDataArray objectAtIndex:self.selectIndex.section+1];
   
    NSMutableArray * array =[dic objectForKey:str];
    
    int contentCount = [array count];
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [_fenLeiTableView insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [_fenLeiTableView deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    

	
	[_fenLeiTableView endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [_fenLeiTableView indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES   nextDo:NO ];
    }
    if (self.isOpen) [_fenLeiTableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

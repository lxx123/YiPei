//
//  CarSortWithNameViewController.m
//  YiPei
//
//  Created by daichuanning on 13-11-30.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "CarSortWithNameViewController.h"
#import "UINavigationView.h"

#import "TypeClickCell.h"
#import "TypeCell.h"
@interface CarSortWithNameViewController ()


@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;

@property(nonatomic,strong) IBOutlet UINavigationView * headNav;

@end

@implementation CarSortWithNameViewController

@synthesize headNav = _headNav;

@synthesize sortWithNameTableView =_sortWithNameTableView;

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
    
    
    sortWithNameArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;
    NSMutableArray  * arry;
    
    arry = [[NSMutableArray alloc] initWithObjects:@"01",@"02",@"03", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"第零" forKey:@"name"];
    
    [dic setValue:arry forKey:@"0"];
    [sortWithNameArray addObject:dic];
    
    arry = [[NSMutableArray alloc] initWithObjects:@"11",@"12",@"13", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:arry forKey:@"1"];
    [dic setValue:@"第一" forKey:@"name"];
    [sortWithNameArray addObject:dic];
    
    arry = [[NSMutableArray alloc] initWithObjects:@"21",@"22",@"23", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"第二" forKey:@"name"];
    
    [dic setValue:arry forKey:@"2"];
    [sortWithNameArray addObject:dic];
    
    arry = [[NSMutableArray alloc] initWithObjects:@"31",@"32",@"33", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"第三" forKey:@"name"];
    
    [dic setValue:arry forKey:@"3"];
    [sortWithNameArray addObject:dic];
    
    arry = [[NSMutableArray alloc] initWithObjects:@"41",@"42",@"43", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"第四" forKey:@"name"];
    
    [dic setValue:arry forKey:@"4"];
    [sortWithNameArray addObject:dic];
    
    _sortWithNameTableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
   
    
    //    [_universalTableView reloadData];
    
    
  
    
    [_sortWithNameTableView reloadData];
    
    [self initLeftBarButtonItem];
    [self initRightBarButtonItem];

}
-(void)initLeftBarButtonItem{
    
    [_headNav initWithLeftBarItemWithTitle:@"" withFrame:CGRectMake(10, 7, 50, 30)  withAction:@selector(leftBarItemClick) withButtonImage:[UIImage imageNamed:@"btn_back_press.png"] withHighlighted:nil withTarget:self];
    
  
    
}
- (void)viewWillAppear:(BOOL)animated
{
    
    //    self.navigationController.navigationBarHidden = NO;
}

-(void)leftBarItemClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)initRightBarButtonItem{
    
    [_headNav initWithRightBarItemWithTitle:@"" withFrame:CGRectMake(260,7, 50, 30) withAction:@selector(rightBarItemClick) withButtonImage:[UIImage imageNamed:@"topbtn_complete.png"] withHighlighted:nil withTarget:self];
    

    
}
-(void)rightBarItemClick{
    [self.navigationController popViewControllerAnimated:YES];
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
  
 
        return [sortWithNameArray count];
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
        if (self.isOpen) {
            if (self.selectIndex.section == section) {
                NSString * rowStr = [NSString stringWithFormat:@"%i",section];
                NSMutableDictionary * dic = [sortWithNameArray objectAtIndex:section];
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
            static NSString *CellIdentifier1 = @"TypeClickCell";
            TypeClickCell *cell = (TypeClickCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
            
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier1 owner:self options:nil] objectAtIndex:0];
                [cell cellClickButton];
                cell.delegate = self;
                UIImageView * backIamge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteColor.png"]];
                cell.backgroundView = backIamge;
                
            }
            NSString * str = [NSString stringWithFormat:@"%i",indexPath.section];
            NSMutableDictionary * dic = [sortWithNameArray objectAtIndex:indexPath.section];
            
            NSArray *list = [dic objectForKey:str];
            
            cell.indexP = indexPath;
            cell.titleLabel.text = [list objectAtIndex:indexPath.row-1];
            
            return cell;
        }else
        {
            static NSString *CellIdentifier = @"TypeCell";
            TypeCell *cell = (TypeCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
            }
            cell.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
            
            NSString * str = [NSString stringWithFormat:@"%i",indexPath.row];
            NSMutableDictionary * dic = [sortWithNameArray objectAtIndex:indexPath.section];
            
            
            //        NSMutableArray * array = [[_fenLeiDataArray objectAtIndex:indexPath.section] objectForKey:str];
            //        NSLog(@"array=%@",array);
            
            NSString *name = [dic objectForKey:@"name"];
            cell.titleLabel.text = name;
            cell.titleLabel.textColor = [UIColor colorWithRed:129/255.0 green:129/255.0 blue:129/255.0 alpha:1.0];
            UIImage * image =[UIImage imageNamed:@"bg_brand_hot.png"];
            NSLog(@"name====%@",name);
            
            //        [cell showImage:image];
            [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath]?YES:NO)];
            return cell;
        }
        
}
-(void)setBordForView:(UIView*)view withBorder:(NSInteger)border withColor:(UIColor*)color{
    //设置layer
    CALayer *layer=[view layer];
    //是否设置边框以及是否可见
    [layer setMasksToBounds:YES];
    
    //设置边框线的宽
    
    [layer setBorderWidth:border];
    //设置边框线的颜色
    [layer setBorderColor:[color CGColor]];
}

-(void)setViewCornerRadius:(UIView *)view withCornerRadius:(NSInteger)radius{
    view.layer.cornerRadius = radius;
    view.layer.masksToBounds = YES;
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
            
        }
        
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)typeClickCellDelegate:(NSIndexPath *)indexP{
    
    NSLog(@"indexP ====%@",indexP);
}
- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert  nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    
    TypeCell *cell = (TypeCell *)[_sortWithNameTableView cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    
    [_sortWithNameTableView beginUpdates];
    
    int section = self.selectIndex.section;
    NSString * str = [NSString stringWithFormat:@"%i",self.selectIndex.section ];
    NSMutableDictionary * dic =[sortWithNameArray objectAtIndex:self.selectIndex.section];
    
    NSMutableArray * array =[dic objectForKey:str];
    
    int contentCount = [array count];
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [_sortWithNameTableView insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [_sortWithNameTableView deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    
    
	
	[_sortWithNameTableView endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [_sortWithNameTableView indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES   nextDo:NO ];
    }
    if (self.isOpen) [_sortWithNameTableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

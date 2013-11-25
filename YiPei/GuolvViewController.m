//
//  GuolvViewController.m
//  YiPei
//
//  Created by daichuanning on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "GuolvViewController.h"
//#import "Cell1.h"
//#import  "Cell2.h"

#import "TypeCell.h"
#import "TypeClickCell.h"
@interface GuolvViewController ()
@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;
@end

@implementation GuolvViewController


@synthesize filterScrollView =_filterScrollView;
@synthesize typeTableView = _typeTableView;

@synthesize universalView = _universalView;
@synthesize universalTableView = _universalTableView;

@synthesize isOpen = _isOpen;
@synthesize selectIndex = _selectIndex;

@synthesize choseCarButton = _choseCarButton;
@synthesize universalButton = _universalButton;

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
    
    self.isOpen = NO;
    typeArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;
    NSMutableArray  * arry;
    
    arry = [[NSMutableArray alloc] initWithObjects:@"01",@"02",@"03", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"第零" forKey:@"name"];
    
    [dic setValue:arry forKey:@"0"];
    [typeArray addObject:dic];
    
    arry = [[NSMutableArray alloc] initWithObjects:@"11",@"12",@"13", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:arry forKey:@"1"];
    [dic setValue:@"第一" forKey:@"name"];
    [typeArray addObject:dic];
    
    arry = [[NSMutableArray alloc] initWithObjects:@"21",@"22",@"23", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"第二" forKey:@"name"];
    
    [dic setValue:arry forKey:@"2"];
    [typeArray addObject:dic];
    
    arry = [[NSMutableArray alloc] initWithObjects:@"31",@"32",@"33", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"第三" forKey:@"name"];
    
    [dic setValue:arry forKey:@"3"];
    [typeArray addObject:dic];
    
    arry = [[NSMutableArray alloc] initWithObjects:@"41",@"42",@"43", nil];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"第四" forKey:@"name"];
    
    [dic setValue:arry forKey:@"4"];
    [typeArray addObject:dic];
    
   
    
    
    _typeTableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
//    _filterScrollView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];

//    [_universalTableView reloadData];
    NSLog(@"typeArray.count==%i",typeArray.count);
    
    universalArray = [[NSMutableArray alloc]initWithObjects:@"品牌",@"车系",@"车型", nil];
    _typeTableView.frame = CGRectMake(0, 0, 320, typeArray.count * 64);
    
    _universalTableView.frame = CGRectMake(0, 58, 320, universalArray.count *44);
    _universalView.frame = CGRectMake(0, typeArray.count * 64 + 58, 320, 60 + universalArray.count * 44);
//    _universalView.backgroundColor = [UIColor redColor];
//    _universalTableView.backgroundColor = [UIColor blackColor];

    CGSize size = CGSizeMake(320, typeArray.count * 64 + 58 + 80 + universalArray.count * 44);
    [_filterScrollView setContentSize:size];
    
     [_typeTableView reloadData];
    [_universalTableView reloadData];
    
    [self clickChoseCarButtonNotUniversalButtonImage];
    [self initLeftBarButtonItem];
    [self initRightBarButtonItem];
}

-(void)initLeftBarButtonItem{
    UIButton * leftButton = [[UIButton alloc] init];
    leftButton.frame = CGRectMake(10,7, 30, 30);
    
    [leftButton setBackgroundImage:[UIImage imageNamed:@"btn_back_press.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBarItemClick) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem * leftBarItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton ];
    
    
    
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}
-(void)leftBarItemClick{
}
-(void)initRightBarButtonItem{
    
    
    UIButton * rightButton = [[UIButton alloc] init];
    rightButton.frame = CGRectMake(260,7, 50, 30);
    
    [rightButton setBackgroundImage:[UIImage imageNamed:@"topbtn_complete.png"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBarItemClick) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem * rightBarItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton ];
    
    
    
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}
-(void)rightBarItemClick{
    
}

-(void)clickChoseCarButtonNotUniversalButtonImage{
    [_choseCarButton setImage:[UIImage imageNamed:@"btn_car_choose_press.png"] forState:UIControlStateNormal];
    [_universalButton setImage:[UIImage imageNamed:@"btn_car_ general.png"] forState:UIControlStateNormal];
}
-(void)clickUniversalButtonImageNotChoseCarButtonNot{
    [_choseCarButton setImage:[UIImage imageNamed:@"btn_car_choose.png"] forState:UIControlStateNormal];
    [_universalButton setImage:[UIImage imageNamed:@"btn_car_ general_press.png"] forState:UIControlStateNormal];
}
-(IBAction)clickChoseCarButton:(id)sender{
    [self clickChoseCarButtonNotUniversalButtonImage];
}
-(IBAction)clickUniversalButton:(id)sender{
    [self clickUniversalButtonImageNotChoseCarButtonNot];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_typeTableView) {
        if (self.isOpen) {
            if (self.selectIndex.section == indexPath.section) {
                if(indexPath.row==0){
                    return 64;
                }
                return 45;;
            }
        }
        
        return 64;
    }else{
        return 44;
    }
   
}
//返回有多少个TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView ==_typeTableView) {
        NSLog(@"typeArray.count==%i",typeArray.count);
    return [typeArray count];
    }else
        return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==_typeTableView) {
        if (self.isOpen) {
            if (self.selectIndex.section == section) {
                NSString * rowStr = [NSString stringWithFormat:@"%i",section];
                NSMutableDictionary * dic = [typeArray objectAtIndex:section];
                NSMutableArray * array = [dic objectForKey:rowStr];
                return [array count]+1;;
            }
        }
        return 1;
    }else
        
    return universalArray.count;
    
    //    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==_typeTableView) {
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
            NSMutableDictionary * dic = [typeArray objectAtIndex:indexPath.section];
            
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
            NSMutableDictionary * dic = [typeArray objectAtIndex:indexPath.section];
            
            
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
    }else{
        static NSString *CellIdentifier = @"UITableViewCell";
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
              cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text = [universalArray objectAtIndex:indexPath.row];
        return cell;
    }
    
}


#pragma mark - Table view delegate
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_typeTableView) {
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

    }else{
        
    }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)typeClickCellDelegate:(NSIndexPath *)indexP{
    
    NSLog(@"indexP ====%@",indexP);
}
- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert  nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    
    TypeCell *cell = (TypeCell *)[_typeTableView cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    
    [_typeTableView beginUpdates];
    
    int section = self.selectIndex.section;
    NSString * str = [NSString stringWithFormat:@"%i",self.selectIndex.section ];
    NSMutableDictionary * dic =[typeArray objectAtIndex:self.selectIndex.section];
    
    NSMutableArray * array =[dic objectForKey:str];
    
    int contentCount = [array count];
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [_typeTableView insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [_typeTableView deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    
    
	
	[_typeTableView endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [_typeTableView indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES   nextDo:NO ];
    }
    if (self.isOpen) [_typeTableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  GuolvDetailViewController.m
//  YiPei
//
//  Created by daichuanning on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//


@interface GuolvDetailModel : NSString
@property(nonatomic, strong)NSString * name;
@property(nonatomic, strong)NSString * letter;

@property(nonatomic, strong)UIImageView * brandImage;

@end


@implementation GuolvDetailModel

@synthesize name = _name;
@synthesize letter = _letter;
@synthesize brandImage = _brandImage;

@end



#import "GuolvDetailViewController.h"
#import "UINavigationView.h"
#define  COLOR_WITH_RGB(x,y,z) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:y/255.0 alpha:1.0]


@interface GuolvDetailViewController ()
@property(nonatomic,strong) IBOutlet UINavigationView * headNav;

@end

@implementation GuolvDetailViewController

@synthesize  tableHeadView = _tableHeadView;
@synthesize nameLab = _nameLab;
@synthesize detailTableView = _detailTableView;

@synthesize headNav = _headNav;

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
    _tableHeadView.backgroundColor = COLOR_WITH_RGB(45,45,45);
    _nameLab.textColor = COLOR_WITH_RGB(252,187,1);
   
    _detailTableView.backgroundColor = COLOR_WITH_RGB(45,45,45);
    _detailTableView.separatorColor = COLOR_WITH_RGB(34, 34, 34);
    datailArray = [[NSMutableArray alloc]init];
    
    GuolvDetailModel * model = [[GuolvDetailModel alloc] init];
    model.name = @"宝马";
    model.letter = @"B";
    model.brandImage = nil;
    [datailArray addObject:model];
    [_detailTableView reloadData];
  
    [_headNav initWithLeftBarItemWithTitle:@"" withFrame:CGRectMake(10, 7, 50, 30)  withAction:@selector(back) withButtonImage:[UIImage imageNamed:@"topbtn_back_press.png"]  withTarget:self];
}
-(void)back{
    
    NSLog(@"**********back**********");
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissModalViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    
//    self.navigationController.navigationBarHidden = NO;
}
//返回有多少个TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return datailArray.count;
}

//返回TableView中有多少数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;

    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        static NSString *CellIdentifier = @"CellIdentifier";
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            UIImageView * imageView= [[UIImageView alloc] init];
            imageView.backgroundColor = [UIColor whiteColor];
            imageView.frame = CGRectMake(10, 8, 32, 32);
            imageView.tag = 0x1;
            [cell addSubview:imageView];
            
            UILabel * lab;
            
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(50, 2, 200, 44);
            lab.backgroundColor = [UIColor clearColor];
            lab.tag = 0x2;
            lab.textColor = [UIColor whiteColor];
            [cell addSubview:lab];
            
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(250, 2, 26, 44);
            lab.backgroundColor = [UIColor clearColor];
            lab.tag = 0x3;
            lab.font = [UIFont systemFontOfSize:14.0];
            lab.textColor = COLOR_WITH_RGB(153, 153, 153);
            
            [cell addSubview:lab];
            
            UIButton * clickBut = [[UIButton alloc] init];
            clickBut.frame = CGRectMake(276, 17, 17, 17);
            clickBut.tag = 0x4;
            clickBut.backgroundColor = [UIColor clearColor];
//            [clickBut addTarget:self action:@selector() forControlEvents:UIControlEventTouchDown];
             [cell addSubview:clickBut];
            
            
        }
    
        UIImageView * imageV = (UIImageView*)[cell viewWithTag:0x1];
        UILabel * nameLab = (UILabel *)[cell viewWithTag:0x2];
        UILabel * letterLab = (UILabel *)[cell viewWithTag:0x3];
        UIButton * clickbut  = (UIButton *)[cell viewWithTag:0x4];
    GuolvDetailModel * model = [datailArray objectAtIndex:indexPath.row];
    nameLab.text = model.name;
    letterLab.text = model.letter;
    [clickbut setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
        
        return cell;
    }
-(void)clickButton:(id)sender{
    UITableViewCell * cell;
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0) {
         cell = (UITableViewCell *)[[sender superview] superview];
    }else{
        cell = (UITableViewCell *)[sender superview] ;

    }
    NSIndexPath * indexP = [_detailTableView indexPathForCell:cell];
    
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    UIButton * clickbut  = (UIButton *)[cell viewWithTag:0x4];
    [clickbut setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

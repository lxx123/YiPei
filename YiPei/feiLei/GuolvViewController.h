//
//  GuolvViewController.h
//  YiPei
//
//  Created by daichuanning on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuolvViewController : UIViewController
{
    NSMutableArray * typeArray;
    
    NSMutableArray * universalArray;
    NSInteger selectRow;
    
}
@property(nonatomic,strong) IBOutlet UIScrollView * filterScrollView;
@property(nonatomic,strong) IBOutlet UITableView * typeTableView;

@property(nonatomic,strong) IBOutlet UIView * universalView;
@property(nonatomic,strong) IBOutlet UITableView * universalTableView;

@property(nonatomic,strong) IBOutlet UIView * lineView;

@property(nonatomic,strong) IBOutlet UIButton * choseCarButton;
@property(nonatomic,strong) IBOutlet UIButton * universalButton;
@end

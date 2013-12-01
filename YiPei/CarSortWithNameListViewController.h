//
//  CarSortWithNameListViewController.h
//  YiPei
//
//  Created by daichuanning on 13-12-1.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
//点击第四级的列表的跳转的页面
@interface CarSortWithNameListViewController : UIViewController

<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray * sortWithNameListArray;
    NSMutableArray * smallTableArray;
    
    BOOL isSort;
    //    BOOL isFilter;
}
@property(nonatomic, strong) IBOutlet UITableView * sortWithNameListTableView;

@property(nonatomic, strong) IBOutlet UITableView * smallTableView;

@property(nonatomic, strong) IBOutlet UIButton * sortButton;
@property(nonatomic, strong) IBOutlet UIButton * filterButton;


@property(nonatomic, strong) IBOutlet UIView * blckView;

 
@end

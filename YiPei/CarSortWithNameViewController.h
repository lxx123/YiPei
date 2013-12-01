//
//  CarSortWithNameViewController.h
//  YiPei
//
//  Created by daichuanning on 13-11-30.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
//车型筛选的页面
@interface CarSortWithNameViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * sortWithNameArray;
}

@property(nonatomic, strong) IBOutlet UITableView * sortWithNameTableView;
@end

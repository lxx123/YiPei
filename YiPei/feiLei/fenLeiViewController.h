//
//  fenLeiViewController.h
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataProcessProtocol.h"

@class fenLeiFunc;
@interface fenLeiViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,dataGoodsCategoryByPidProcessProtocol>{
    NSMutableArray * fenLeiDataArray;//存放分类的数据 数组
    
    fenLeiFunc *feiLFunction;
}
@property(nonatomic, strong) IBOutlet UITableView * fenLeiTableView;
@property(nonatomic, strong) NSMutableArray * fenLeiDataArray;//存放分类的数据 数组
@property(nonatomic, strong) fenLeiFunc *feiLFunction;

@end

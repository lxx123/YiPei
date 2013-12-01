//
//  GuolvDetailViewController.h
//  YiPei
//
//  Created by daichuanning on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
//过滤详情  如选择了品牌进入品牌的列表
@interface GuolvListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * datailArray;
    NSMutableArray * dataArray;//存放每一步的数据
    NSInteger step;//纪录每一步
    
    NSIndexPath * indexPa;//选择 了那一个
    
}


@property(nonatomic, strong) IBOutlet UIView * tableHeadView;
@property(nonatomic, strong) IBOutlet UILabel * nameLab;
@property(nonatomic, strong) IBOutlet UITableView * detailTableView;


@end

//
//  GuolvDetialViewController.h
//  YiPei
//
//  Created by daichuanning on 13-11-28.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LKPopupMenuController.h"
//按照车身分类

@interface CheShenFenLeiViewController : UIViewController<LKPopupMenuControllerDelegate>{
    LKPopupMenuController* popupMenu;
    
    NSMutableArray * dataArray;//四个数据都放在同一个数组中，防止切换数组
    
    NSMutableArray * nameArray;//
    NSMutableArray * valueArray;//
    NSString * titleStr;
    
    BOOL  isCarOrSuv;
}
//汽车上面的四个按钮，但是不知道什么名字，久就用button1-4来表示

@property(nonatomic, strong) IBOutlet UIButton * carButton;
@property(nonatomic, strong) IBOutlet UIButton * suvButton;

@property (nonatomic, strong) LKPopupMenuController* popupMenu;

@property(nonatomic,strong)IBOutletCollection(UIButton) NSMutableArray * buttonArray;

//@property(nonatomic,strong)IBOutlet UIButton * button1;
//@property(nonatomic,strong)IBOutlet UIButton * button2;
//@property(nonatomic,strong)IBOutlet UIButton * button3;
//@property(nonatomic,strong)IBOutlet UIButton * button4;


@property(nonatomic,strong)IBOutlet UIImageView * carImageView;
@end

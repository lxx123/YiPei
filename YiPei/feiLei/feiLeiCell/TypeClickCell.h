//
//  TypeClickCell.h
//  YiPei
//
//  Created by daichuanning on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TypeClickCellDelegate <NSObject>

-(void)typeClickCellDelegate:(NSIndexPath *)indexP;

@end
@interface TypeClickCell : UITableViewCell

@property(nonatomic,weak)id<TypeClickCellDelegate>delegate;
@property(nonatomic,strong)NSIndexPath * indexP;
@property (nonatomic,strong)IBOutlet UILabel *titleLabel;
@property(nonatomic,strong) IBOutlet UIButton * clickButton;

-(void)cellClickButton;

@end

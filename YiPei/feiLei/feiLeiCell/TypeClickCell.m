//
//  TypeClickCell.m
//  YiPei
//
//  Created by daichuanning on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "TypeClickCell.h"

@implementation TypeClickCell


@synthesize titleLabel = _titleLabel;
@synthesize clickButton =_clickButton;
@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)cellTitleLabelText:(NSString *)str{
    _titleLabel.text = str;
    _titleLabel.font = [UIFont systemFontOfSize:14.0];
    
    _titleLabel.textColor = [UIColor colorWithRed:129/255.0 green:129/255.0 blue:129/255.0 alpha:1.0];
}
-(void)cellClickButton{
    [_clickButton addTarget:self action:@selector(clickOnButton:) forControlEvents:UIControlEventTouchDown];
}
-(void)clickOnButton:(id)sender{
    if ([_delegate respondsToSelector:@selector(typeClickCellDelegate:)]) {
        [_delegate typeClickCellDelegate:_indexP];
    }
}
@end

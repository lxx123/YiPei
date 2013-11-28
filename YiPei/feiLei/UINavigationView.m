//
//  UINavigationView.m
//  YiPei
//
//  Created by daichuanning on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "UINavigationView.h"

@implementation UINavigationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)initWithLeftBarItemWithTitle:(NSString *)title withFrame:(CGRect)frame withAction:(SEL)action withButtonImage:(UIImage *)image withTarget:(UIViewController *)controller{
    UIButton * button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [self addSubview:button];
    [button addTarget:controller action:action forControlEvents:UIControlEventTouchDown];
    
}
-(void)initWithRightBarItemWithTitle:(NSString *)title withFrame:(CGRect)frame withAction:(SEL)action withButtonImage:(UIImage *)image withTarget:(UIViewController *)controller{
    UIButton * button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [self addSubview:button];
    [button setBackgroundImage:image forState:UIControlStateNormal];

    [button addTarget:controller action:action forControlEvents:UIControlEventTouchDown];
}
-(void)initWithCenterItemWithTitle:(NSString *)title withFrame:(CGRect)frame  {
    UILabel * lab = [[UILabel alloc] initWithFrame:frame];
    lab.text = title;
    [self addSubview:lab];
}

@end

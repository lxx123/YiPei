//
//  UINavigationView.h
//  YiPei
//
//  Created by daichuanning on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationView : UIView




-(void)initWithLeftBarItemWithTitle:(NSString *)title withFrame:(CGRect)frame withAction:(SEL)action withButtonImage:(UIImage *)image withTarget:(UIViewController *)controller;
-(void)initWithRightBarItemWithTitle:(NSString *)title withFrame:(CGRect)frame   withAction:(SEL)action  withButtonImage:(UIImage *)image  withTarget:(UIViewController *)controller;

-(void)initWithCenterItemWithTitle:(NSString *)title;


@end

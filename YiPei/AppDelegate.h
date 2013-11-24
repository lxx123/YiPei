//
//  AppDelegate.h
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeveyTabBarController.h"
@class shouYeViewController;
@class fenLeiViewController;
@class pinPaiViewController;
@class cheXingViewController;
@class CustomTabBar;
@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate,LeveyTabBarControllerDelegate,LeveyTabBarDelegate>

@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) CustomTabBar *tabBarController;
@property (strong, nonatomic) shouYeViewController *shouYeVc;
@property (strong, nonatomic) fenLeiViewController *fenLeiVc;
@property (strong, nonatomic) pinPaiViewController *pinPaiVc;
@property (strong, nonatomic) cheXingViewController *cheXingVc;
@property (strong, nonatomic) UINavigationController *shouYeNavCtrl;
@property (strong, nonatomic) UINavigationController *fenLeiNavCtrl;
@property (strong, nonatomic) UINavigationController *pinPaiNavCtrl;
@property (strong, nonatomic) UINavigationController *cheXingNavCtrl;

+(AppDelegate *)shsharedeApp;
@end

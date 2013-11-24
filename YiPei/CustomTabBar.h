//
//  CustomTabBar.h
//  Hxzts3.0
//
//  Created by lixiao on 12-1-10.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface CustomTabBar : UITabBarController<UITabBarControllerDelegate> {
	UIButton *shouYeBtn;
	UIButton *fenLeiBtn;
	UIButton *pinPaiBtn;
	UIButton *cheXingBtn;
	UIImageView *imgView;
    BOOL FIRSTTIME;
}
@property(nonatomic)BOOL FIRSTTIME;
- (void)hideRealTabBar;

- (void)customTabBar;
@end

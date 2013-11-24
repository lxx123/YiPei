    //
//  CustomTabBar.m
//  Hxzts3.0
//
//  Created by lixiao on 12-1-10.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
#import "allConfig.h"
#import "CustomTabBar.h"

@implementation CustomTabBar

//static BOOL FIRSTTIME =YES;
@synthesize FIRSTTIME;

- (void)viewDidLoad {
    [super viewDidLoad];
    FIRSTTIME =YES;
    
    
}


- (void)viewDidAppear:(BOOL)animated{
	if (FIRSTTIME) {
		[[NSNotificationCenter defaultCenter] removeObserver:self name:@"hideCustomTabBar" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(hideCustomTabBar)
                                                     name: @"hideCustomTabBar"
                                                   object: nil];
		[[NSNotificationCenter defaultCenter] removeObserver:self name:@"bringCustomTabBarToFront" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(bringCustomTabBarToFront)
                                                     name: @"bringCustomTabBarToFront"
                                                   object: nil];
		[self hideRealTabBar];
		[self customTabBar];
		FIRSTTIME = NO;
	}

}

//将自定义的tabbar显示出来
- (void)bringCustomTabBarToFront{
	NSLog(@"bringCustomTabBarToFront========");
	[imgView setHidden:NO];
	[shouYeBtn setHidden:NO];
	[fenLeiBtn setHidden:NO];
	[pinPaiBtn setHidden:NO];
	[cheXingBtn setHidden:NO];
}

//隐藏自定义tabbar
- (void)hideCustomTabBar{
	[imgView setHidden:YES];
	[shouYeBtn setHidden:YES];
	[fenLeiBtn setHidden:YES];
	[pinPaiBtn setHidden:YES];
	[cheXingBtn setHidden:YES];
}



- (void)hideRealTabBar{
	for(UIView *view in self.view.subviews){
		if([view isKindOfClass:[UITabBar class]]){
			view.hidden = YES;
			break;
		}
	}
}

//-(void)hideTabBar{
//	[self hideRealTabBar];
//	
//}




- (void)customTabBar{
	imgView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"bg_menu.png"]];
	//imgView.frame = CGRectMake(0, 430, 330, 53);
    imgView.frame=CGRectMake(0, __MainScreen_Height-49, 320, 49);
	[self.view addSubview:imgView];
    
	double _width = 80;
	double _height = 49;
	
	
	
	//首页
	shouYeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
	shouYeBtn.frame=CGRectMake(1, __MainScreen_Height-49, _width, _height);
	shouYeBtn.tag=1;
	[shouYeBtn setBackgroundImage:[UIImage imageNamed:@"menu_home.png"] forState:UIControlStateNormal];
	[shouYeBtn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shouYeBtn];
	
    
    
	
	//分类
	fenLeiBtn=[UIButton buttonWithType:UIButtonTypeCustom];
	fenLeiBtn.frame=CGRectMake(_width, __MainScreen_Height-49, _width, _height);
	fenLeiBtn.tag=2;
	[fenLeiBtn setBackgroundImage:[UIImage imageNamed:@"menu_class.png"] forState:UIControlStateNormal];
	[fenLeiBtn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:fenLeiBtn];
    
	
    
	
	//品牌
	pinPaiBtn=[UIButton buttonWithType:UIButtonTypeCustom];
	pinPaiBtn.frame=CGRectMake(_width*2, __MainScreen_Height-49, _width, _height);
	pinPaiBtn.tag=3;
	[pinPaiBtn setBackgroundImage:[UIImage imageNamed:@"menu_brand.png"] forState:UIControlStateNormal];
	[pinPaiBtn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:pinPaiBtn];
    
	//车型
	cheXingBtn=[UIButton buttonWithType:UIButtonTypeCustom];
	cheXingBtn.frame=CGRectMake(_width*3, __MainScreen_Height-49, _width, _height);
	cheXingBtn.tag=4;
    //	UIImageView *imag=[[UIImageView alloc]initWithFrame:CGRectMake(32, 0, 22, 11)];
    //	imag.image=[UIImage imageNamed:@"首页--确定1111_03.png"];
    //	[diantaiBt addSubview:imag];
    //	[imag release];
	[cheXingBtn setBackgroundImage:[UIImage imageNamed:@"menu_car.png"] forState:UIControlStateNormal];
	[cheXingBtn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:cheXingBtn];
	
}





- (void)selectedTab:(UIButton *)button{
	if (button.tag==3) {
	}
	if (button.tag==1) {
	}
	if (button.tag==2) {

	}
	if (button.tag==5) {
    }

	self.selectedIndex=button.tag-1;
    switch (button.tag) {
        case 1:
            [shouYeBtn setBackgroundImage:[UIImage imageNamed:@"menu_home_press.png"] forState:UIControlStateNormal];
            [fenLeiBtn setBackgroundImage:[UIImage imageNamed:@"menu_class.png"] forState:UIControlStateNormal];
            [pinPaiBtn setBackgroundImage:[UIImage imageNamed:@"menu_brand.png"] forState:UIControlStateNormal];
            [cheXingBtn setBackgroundImage:[UIImage imageNamed:@"menu_car.png"] forState:UIControlStateNormal];
            break;
            
        case 2:
            [shouYeBtn setBackgroundImage:[UIImage imageNamed:@"menu_home.png"] forState:UIControlStateNormal];
            [fenLeiBtn setBackgroundImage:[UIImage imageNamed:@"menu_class_press.png"] forState:UIControlStateNormal];
            [pinPaiBtn setBackgroundImage:[UIImage imageNamed:@"menu_brand.png"] forState:UIControlStateNormal];
            [cheXingBtn setBackgroundImage:[UIImage imageNamed:@"menu_car.png"] forState:UIControlStateNormal];
            
            break;
            
        case 3:
            [shouYeBtn setBackgroundImage:[UIImage imageNamed:@"menu_home.png"] forState:UIControlStateNormal];
            [fenLeiBtn setBackgroundImage:[UIImage imageNamed:@"menu_class.png"] forState:UIControlStateNormal];
            [pinPaiBtn setBackgroundImage:[UIImage imageNamed:@"menu_brand_press.png"] forState:UIControlStateNormal];
            [cheXingBtn setBackgroundImage:[UIImage imageNamed:@"menu_car.png"] forState:UIControlStateNormal];
            
            break;
        case 4:
            [shouYeBtn setBackgroundImage:[UIImage imageNamed:@"menu_home.png"] forState:UIControlStateNormal];
            [fenLeiBtn setBackgroundImage:[UIImage imageNamed:@"menu_class.png"] forState:UIControlStateNormal];
            [pinPaiBtn setBackgroundImage:[UIImage imageNamed:@"menu_brand.png"] forState:UIControlStateNormal];
            [cheXingBtn setBackgroundImage:[UIImage imageNamed:@"menu_car_press.png"] forState:UIControlStateNormal];
            
            break;
        default:
            break;
    }
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
@end


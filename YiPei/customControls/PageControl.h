
#import <UIKit/UIKit.h>

@protocol PageControlDelegate;

@interface PageControl : UIView 
{
@private
    NSInteger _currentPage;
    NSInteger _numberOfPages;
    UIColor *dotColorCurrentPage;
    UIColor *dotColorOtherPage;
    NSObject<PageControlDelegate> *delegate;
}


/**
 currentPage:设置当前的page
 numberOfPages:设置总的pages
 */
@property (nonatomic) NSInteger currentPage;
@property (nonatomic) NSInteger numberOfPages;

/**
 dotColorCurrentPage:设置当前点的颜色
 dotColorOtherPage:设置其他点的颜色
 */
@property (nonatomic, strong) UIColor *dotColorCurrentPage;
@property (nonatomic, strong) UIColor *dotColorOtherPage;

/**
 delegate:代理，可选的。
 当user设置的时候，点击小点的时候，会产生回调
 */
@property (nonatomic, strong) NSObject<PageControlDelegate> *delegate;

@end

@protocol PageControlDelegate<NSObject>
@optional
- (void)pageControlPageDidChange:(PageControl *)pageControl;
@end
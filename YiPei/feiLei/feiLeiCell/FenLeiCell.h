
#import <UIKit/UIKit.h>

@interface FenLeiCell : UITableViewCell

@property (nonatomic,strong)IBOutlet UIImageView * showImageView;
@property (nonatomic,strong)IBOutlet UILabel *titleLabel;
@property (nonatomic,strong)IBOutlet UIImageView *arrowImageView;

- (void)changeArrowWithUp:(BOOL)up;
-(void)showImage:(UIImage *)image;
@end

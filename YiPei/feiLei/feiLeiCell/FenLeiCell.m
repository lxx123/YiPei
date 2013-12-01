
#import "FenLeiCell.h"

@implementation FenLeiCell
@synthesize titleLabel,arrowImageView,showImageView;


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

- (void)changeArrowWithUp:(BOOL)up
{
    if (up) {
        self.arrowImageView.image = [UIImage imageNamed:@"icon_arrow1_up.png"];
    }else
    {
        self.arrowImageView.image = [UIImage imageNamed:@"icon_arrow1_down.png"];
    }
}

-(void)showImage:(UIImage *)image{
    self.showImageView.image = image;
}
-(void)showImageView:(NSString*)url{
//    self.showImageView = []
}
@end

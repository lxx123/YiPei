//
//  DiYuCell2.m
//  IYLM
//
//  Created by JianYe on 13-1-11.
//  Copyright (c) 2013年 Jian-Ye. All rights reserved.
//

#import "FenLeiCell2.h"

@implementation FenLeiCell2
@synthesize titleLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)cellBackgroundColor{
    self.backgroundColor = [UIColor whiteColor];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

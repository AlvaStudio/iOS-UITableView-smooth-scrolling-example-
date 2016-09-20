//
//  CustomCell.m
//  Empty
//
//  Created by Alex Sid on 20.09.16.
//  Copyright © 2016 AlvaStudio. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize iconView, titleLabel, descLabel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:iconView];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel.font = [UIFont fontWithName:@"Arial" size:18];
        [self addSubview:titleLabel];
        
        descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        descLabel.font = [UIFont fontWithName:@"Arial" size:12];
        [self addSubview:descLabel];
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    iconView.frame = CGRectMake(2, 2, self.bounds.size.height - 4, self.bounds.size.height - 4);
    
    titleLabel.frame = CGRectMake(self.bounds.size.height, 2,
                                  self.bounds.size.width - self.bounds.size.height - 4,
                                  (self.bounds.size.height - 4)/2);
    descLabel.frame = CGRectMake(self.bounds.size.height, self.bounds.size.height/2,
                                  self.bounds.size.width - self.bounds.size.height - 4,
                                  (self.bounds.size.height - 4)/2);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  SYFDefaultCell.m
//  Demo
//
//  Created by floyd on 13-5-18.
//  Copyright (c) 2013年 floydshen. All rights reserved.
//

#import "SYFDefaultCell.h"

@implementation SYFDefaultCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.title = [[[UILabel alloc] initWithFrame:CGRectMake(30, 10, 300, 15)] autorelease];
        self.title.font = [UIFont boldSystemFontOfSize:12];
       
        self.image = [UIImage imageNamed:@"star.png"];
        self.cellImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 20, 20)] autorelease];
        
        [self.cellImageView setImage:self.image];
        [self.contentView addSubview:self.cellImageView];
        [self.contentView addSubview:self.title];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellInfo:(NSDictionary *)dict
{
    self.title.text = dict[@"title"];
}

@end

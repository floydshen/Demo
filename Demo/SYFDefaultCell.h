//
//  SYFDefaultCell.h
//  Demo
//
//  Created by floyd on 13-5-18.
//  Copyright (c) 2013年 floydshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYFDefaultCell : UITableViewCell

@property(nonatomic, strong) UILabel *title;
@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) UIImageView *cellImageView;

- (void)setCellInfo:(NSDictionary *)dict;

@end

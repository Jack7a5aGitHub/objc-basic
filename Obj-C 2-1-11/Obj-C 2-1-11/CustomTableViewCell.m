//
//  CustomTableViewCell.m
//  Obj-C 2-1-11
//
//  Created by Jack Wong on 2017/12/06.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

@dynamic textLabel;
@dynamic imageView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

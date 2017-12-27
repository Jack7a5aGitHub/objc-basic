//
//  CustomTableViewCell.h
//  Obj-C 2-4-3
//
//  Created by Jack Wong on 2017/12/27.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *telop;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

//
//  CustomTableViewCell.h
//  Obj-C 2-4-1
//
//  Created by Jack Wong on 2017/12/24.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *intro;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *telop;

@end

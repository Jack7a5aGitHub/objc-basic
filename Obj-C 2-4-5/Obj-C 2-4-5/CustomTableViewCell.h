//
//  CustomTableViewCell.h
//  Obj-C 2-4-5
//
//  Created by Jack Wong on 2017/12/30.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *telopLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

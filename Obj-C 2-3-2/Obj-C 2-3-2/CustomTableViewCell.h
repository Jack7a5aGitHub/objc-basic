//
//  CustomTableViewCell.h
//  Obj-C 2-3-2
//
//  Created by Jack Wong on 2017/12/15.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *limitLabel;

@end

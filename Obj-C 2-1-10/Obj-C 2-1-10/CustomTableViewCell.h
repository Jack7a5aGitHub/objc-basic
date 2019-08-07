//
//  CustomTableViewCell.h
//  Obj-C 2-1-10
//
//  Created by Jack Wong on 2017/12/06.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

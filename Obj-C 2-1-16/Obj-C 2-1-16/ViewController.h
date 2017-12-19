//
//  ViewController.h
//  Obj-C 2-1-16
//
//  Created by Jack Wong on 2017/12/11.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSUInteger pageIndex;

@property (weak, nonatomic) IBOutlet UILabel *screenNumber;

@property NSString *strNumber;
@end


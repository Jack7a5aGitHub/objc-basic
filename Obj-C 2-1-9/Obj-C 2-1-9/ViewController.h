//
//  ViewController.h
//  Obj-C 2-1-9
//
//  Created by Jack Wong on 2017/12/05.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    IBOutlet UIDatePicker *datePickerView;
    
}
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UIToolbar *toolBarView;

- (IBAction)doneButton:(id)sender;

- (IBAction)dateChange:(id)sender;

@end


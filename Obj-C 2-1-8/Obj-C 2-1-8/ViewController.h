//
//  ViewController.h
//  Obj-C 2-1-8
//
//  Created by Jack Wong on 2017/11/30.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>{
    
    IBOutlet UILabel *textLabel;
    
    IBOutlet UIPickerView *pickerView;
    /*
    __weak IBOutlet UIToolbar *toolBar;
    
    __weak IBOutlet UIBarButtonItem *doneButton;
     */
}
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end


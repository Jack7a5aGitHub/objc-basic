//
//  ViewController.m
//  Obj-C 2-1-7
//
//  Created by Jack Wong on 2017/11/29.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.textField.delegate = self;
    self.textField.userInteractionEnabled = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (range.length + range.location > textField.text.length){
        return NO;
    }
    
    if ([string isEqualToString:@""] || string.length == 0){
        return YES;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return newLength <= 30;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end

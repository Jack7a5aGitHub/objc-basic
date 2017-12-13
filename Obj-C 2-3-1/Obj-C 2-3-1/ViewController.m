//
//  ViewController.m
//  Obj-C 2-3-1
//
//  Created by Jack Wong on 2017/12/12.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *ageText;
@property (weak, nonatomic) IBOutlet UITextField *weightText;
- (IBAction)saveBtn:(id)sender;

@property NSString *nameStr;
@property int ageInt;
@property double weightDouble;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *getName = [defaults objectForKey:@"name"];
    
    int getAge = [defaults doubleForKey:@"age"];
    NSString *ageString = [NSString stringWithFormat:@"%i",getAge];
    double getWeight = [defaults doubleForKey:@"weight"];
    NSString *weightString = [NSString stringWithFormat:@"%f",getWeight];
    self.nameText.text = getName;
    self.ageText.text = ageString;
    self.weightText.text = weightString;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveBtn:(id)sender {
    
    [self.nameText resignFirstResponder];
    [self.ageText resignFirstResponder];
    [self.weightText resignFirstResponder];
    
    self.nameStr = self.nameText.text;
    self.ageInt = [(self.ageText.text) intValue];
    self.weightDouble = [(self.weightText.text) doubleValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.nameStr forKey:@"name"];
    [defaults setInteger:self.ageInt forKey:@"age"];
    [defaults setDouble:self.weightDouble forKey:@"weight"];
    [defaults synchronize];
    
    NSLog(@"Save completed");
    
}
@end

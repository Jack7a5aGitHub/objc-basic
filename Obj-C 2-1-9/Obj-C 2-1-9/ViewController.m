//
//  ViewController.m
//  Obj-C 2-1-9
//
//  Created by Jack Wong on 2017/12/05.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    datePickerView.hidden = YES;
    self.toolBarView.hidden = YES;
    UITapGestureRecognizer *tapLabel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTapped)];
    tapLabel.numberOfTapsRequired = 1;
    [self.dateLabel addGestureRecognizer:tapLabel];
    self.dateLabel.userInteractionEnabled = YES;
    [self showSelectedDate];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)labelTapped{
    datePickerView.hidden = NO;
    self.toolBarView.hidden = NO;
}

-(void)setupDatePicker{
    
    datePickerView = [[UIDatePicker alloc]init];
    datePickerView.datePickerMode = UIDatePickerModeDate;
    
}
- (void)showSelectedDate{
    
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    [comps setYear:-30];
    NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    [datePickerView setMinimumDate:minDate];
    
}

- (IBAction)doneButton:(id)sender {
    datePickerView.hidden = YES;
    self.toolBarView.hidden = YES;
    
}

- (IBAction)dateChange:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd/MMM/YYYY"];
    self.dateLabel.text = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:datePickerView.date]];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    datePickerView.hidden = YES;
    self.toolBarView.hidden = YES;
}
@end

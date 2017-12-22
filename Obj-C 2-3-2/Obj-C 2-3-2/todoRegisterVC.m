//
//  todoRegisterVC.m
//  Obj-C 2-3-2
//
//  Created by Jack Wong on 2017/12/15.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "todoRegisterVC.h"
#import "ViewController.h"
#import "sqlite3.h"
#import "FMDatabase.h"

@interface todoRegisterVC ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@property (weak, nonatomic) IBOutlet UITextField *limitTextField;
@property NSDate *created;
@property NSDate *modified;
@property NSDate *limit;
@property NSString *stringLimit;

@property UIDatePicker *datePickerView;

@end

@implementation todoRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDatePickerView];
    
}

-(void)viewWillAppear:(BOOL)animated{
  
    [self getCurrentDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)getCurrentDate{
    NSDate *currentDateTime =  [NSDate date];
    self.created = currentDateTime;
    self.modified = currentDateTime;
}

-(void)setupDatePickerView{
    
    self.datePickerView = [[UIDatePicker alloc]init];
    self.datePickerView.datePickerMode = UIDatePickerModeDate;
    [self.datePickerView addTarget:self action:@selector(limitDateAction:) forControlEvents:UIControlEventValueChanged];
    [self.limitTextField setInputView:self.datePickerView];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    [comps setDay:0];
    NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    [self.datePickerView setMinimumDate:minDate];
    
}
- (IBAction)addData:(id)sender {
    [self getCurrentDate];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = paths[0];
    NSString *databasePath = [directory stringByAppendingPathComponent:@"UserDatabase3.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:databasePath];
    
    NSString *title = self.titleTextField.text;
    NSString *contents = self.contentTextField.text;
    NSString *insert = [[NSString alloc] initWithFormat:@"INSERT INTO tr_todo(todo_title, todo_contents, limit_date, created, modified, stringLimit_date) VALUES('%@','%@','%@', '%@', '%@', '%@')", title, contents, self.limit, self.created, self.modified, self.stringLimit];
    [database open];
    [database executeUpdate:insert];
    [database close];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)limitDateAction:(id)sender {
    UIDatePicker *picker = (UIDatePicker *)self.limitTextField.inputView;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd-MM-YYYY"];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *stringDate = [dateFormatter stringFromDate:picker.date];
    
    NSLog(@"%@", stringDate);
   
    self.limitTextField.text = stringDate;
    self.stringLimit = stringDate;
    self.limit = picker.date;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end

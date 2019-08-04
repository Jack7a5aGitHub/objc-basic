//
//  ViewController.m
//  Obj-C 2-1-8
//
//  Created by Jack Wong on 2017/11/30.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *colorArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    colorArray = @[@"Red",@"Blue",@"Black",@"Green",@"White"];
    UITapGestureRecognizer *tapLabel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTapped)];
    tapLabel.numberOfTapsRequired = 1;
    [textLabel addGestureRecognizer:tapLabel];
    textLabel.userInteractionEnabled = YES;
    [self pickerViewSetting];
    
}

-(void)labelTapped{
    pickerView.hidden = NO;
    self.toolBar.hidden = NO;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSString *colorSelected = [colorArray objectAtIndex:row];
    textLabel.text = colorSelected;
    
}

-(void)pickerViewSetting{
    pickerView.hidden = YES;
    self.toolBar.hidden = YES;
    //[toolBar sizeToFit];
    /*
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneAction:)];
    toolBar.items = @[barButtonDone];
     */

}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return colorArray.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return colorArray[row];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [pickerView setHidden:YES];
    [self.toolBar setHidden:YES];
}

- (IBAction)doneAction:(UIBarButtonItem *)sender {
    [pickerView setHidden:YES];
    [self.toolBar setHidden:YES];
}
@end

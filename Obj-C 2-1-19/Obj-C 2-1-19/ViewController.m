//
//  ViewController.m
//  Obj-C 2-1-19
//
//  Created by Jack Wong on 2017/12/12.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)passDataToSecondVC:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)passDataToSecondVC:(id)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"secondStoryboard" bundle:nil];
    SecondViewController *secondVC = [storyBoard instantiateViewControllerWithIdentifier:@"second"];
    secondVC.tempText = self.textField.text;
    [self.navigationController pushViewController:secondVC animated:YES];
    
}
@end

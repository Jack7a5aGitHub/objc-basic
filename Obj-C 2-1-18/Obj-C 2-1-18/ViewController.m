//
//  ViewController.m
//  Obj-C 2-1-18
//
//  Created by Jack Wong on 2017/12/12.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

- (IBAction)pushToSecondVC:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pushToSecondVC:(id)sender {
    SecondViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    [self.navigationController pushViewController:secondVC animated:YES];
}
@end

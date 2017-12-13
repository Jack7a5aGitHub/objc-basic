//
//  SecondViewController.m
//  Obj-C 2-1-17
//
//  Created by Jack Wong on 2017/12/12.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
- (IBAction)backToHomeVC:(id)sender;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backToHomeVC:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
}
@end

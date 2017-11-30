//
//  ViewController.m
//  Obj-C 1.1.4
//
//  Created by Jack Wong on 2017/11/18.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "Account.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.text = @"hello world";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

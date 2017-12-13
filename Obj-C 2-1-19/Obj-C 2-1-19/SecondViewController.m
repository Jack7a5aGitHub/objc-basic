//
//  SecondViewController.m
//  Obj-C 2-1-19
//
//  Created by Jack Wong on 2017/12/12.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.tempText == nil){
        self.tempText = @"hihi";
    }
    self.textLabel.text = self.tempText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

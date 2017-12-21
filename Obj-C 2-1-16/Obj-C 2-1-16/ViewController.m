//
//  ViewController.m
//  Obj-C 2-1-16
//
//  Created by Jack Wong on 2017/12/11.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "PageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenNumber.text = [NSString stringWithFormat:@"Page %@ / %@", self.strNumber, self.totalPage ];//self.strNumber;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

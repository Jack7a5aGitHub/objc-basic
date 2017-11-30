//
//  ViewController.m
//  Obj-C 2-1-5
//
//  Created by Jack Wong on 2017/11/27.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)showActionSheet:(UIButton *)sender {
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Please select one of the actions" preferredStyle:UIAlertControllerStyleActionSheet];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Facebook" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSLog(@"Facebook");
    }]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Twitter" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSLog(@"Twitter");
    }]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Line" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSLog(@"Line");
    }]];
    [self presentViewController:actionSheet animated: YES completion:nil];
}

@end

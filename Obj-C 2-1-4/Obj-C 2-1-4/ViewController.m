//
//  ViewController.m
//  Obj-C 2-1-4
//
//  Created by Jack Wong on 2017/11/25.
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

- (IBAction)alertButton:(UIButton *)sender {
    
    NSString *title = @"Title";
    NSString *message = @"Message";
    NSString *okText = @"OK";
    NSString *cancelText = @"CANCEL";
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okBtn = [UIAlertAction actionWithTitle:okText style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSLog(@"OK");
        
    }];
    
    UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSLog(@"Cancel");
        
    }];
    
    [alert addAction:okBtn];
    [alert addAction:cancelBtn];
    [self presentViewController:alert animated:YES completion:nil];
}
@end

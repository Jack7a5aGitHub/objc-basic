//
//  ViewController.m
//  Obj-C 2-6-1
//
//  Created by Jack Wong on 2017/12/27.
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

- (IBAction)test:(id)sender {
    
    NSString *customURL = @"stv://";
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:@"stv://"];
    if ([application respondsToSelector:@selector(openURL:options:completionHandler:)])
    {
        [application openURL:URL options:@{}
           completionHandler:^(BOOL success) {
               NSLog(@"Open %@: %d",customURL,success);
           }];
    }
    else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error!" message:@"No Custom URL is defined" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end

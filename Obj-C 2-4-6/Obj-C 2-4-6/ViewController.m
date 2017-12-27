//
//  ViewController.m
//  Obj-C 2-4-6
//
//  Created by Jack Wong on 2017/12/25.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

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

- (IBAction)postFacebook:(id)sender {
    
    NSLog(@"Called");
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        
        SLComposeViewController *fbViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [fbViewController addImage:[UIImage imageNamed:@"photo0"]];
        [fbViewController setInitialText:@"My First FaceBook message"];
        [fbViewController setCompletionHandler:^(SLComposeViewControllerResult result) {
            if (result == SLComposeViewControllerResultCancelled){
                NSLog(@"Try to do sth");
            }
        }];
        [self presentViewController:fbViewController animated:YES completion:nil];
        
    } else {
        NSLog(@"Failed to Post");
    }
    
}


@end

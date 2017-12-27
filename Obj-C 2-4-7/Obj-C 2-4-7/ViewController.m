//
//  ViewController.m
//  Obj-C 2-4-7
//
//  Created by Jack Wong on 2017/12/26.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

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

- (IBAction)postTwitter:(id)sender {
    
    NSLog(@"Called");
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
        
        SLComposeViewController *fbViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [fbViewController addImage:[UIImage imageNamed:@"photo0"]];
        [fbViewController setInitialText:[NSString stringWithFormat:@"Twitt Mess %@", self.textField.text]];
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

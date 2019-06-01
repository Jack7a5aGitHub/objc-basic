//
//  ViewController.m
//  Obj-C 2-4-7
//
//  Created by Jack Wong on 2017/12/29.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
@import TwitterKit;


@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property UIImage *imageGet;

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

- (IBAction)composeTweet:(id)sender {
    
    TWTRComposer *composer = [[TWTRComposer alloc] init];
    
    [composer setText:@"just setting up my Twitter Kit"];
    [composer setImage:[UIImage imageNamed:@"photo0"]];
    
    // Called from a UIViewController
    [composer showFromViewController:self completion:^(TWTRComposerResult result) {
        if (result == TWTRComposerResultCancelled) {
            NSLog(@"Tweet composition cancelled");
        }
        else {
            NSLog(@"Sending Tweet!");
        }
    }];
    
}

@end

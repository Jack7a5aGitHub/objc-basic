//
//  ViewController.m
//  Obj-C 2-1-6
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
    NSString *urlString = @"http://www.google.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(UIBarButtonItem *)sender {
    [self.webView goBack];
}
- (IBAction)goForward:(UIBarButtonItem *)sender {
    [self.webView goForward];
}
- (IBAction)Reload:(UIBarButtonItem *)sender {
    [self.webView reload];
}
@end

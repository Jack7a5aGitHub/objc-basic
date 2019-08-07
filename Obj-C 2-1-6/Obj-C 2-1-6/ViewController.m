//
//  ViewController.m
//  Obj-C 2-1-6
//
//  Created by Jack Wong on 2017/11/27.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (readwrite, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)goBack:(UIBarButtonItem *)sender;

- (IBAction)goForward:(UIBarButtonItem *)sender;

- (IBAction)Reload:(UIBarButtonItem *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlString = @"http://www.google.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    self.webView.delegate = self;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Cannot Connect To The Internet" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSLog(@"OK");
        
    }];
    
    [alert addAction:okBtn];
    [self presentViewController:alert animated:YES completion:nil];
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

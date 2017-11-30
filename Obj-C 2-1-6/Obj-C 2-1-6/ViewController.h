//
//  ViewController.h
//  Obj-C 2-1-6
//
//  Created by Jack Wong on 2017/11/27.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)goBack:(UIBarButtonItem *)sender;

- (IBAction)goForward:(UIBarButtonItem *)sender;

- (IBAction)Reload:(UIBarButtonItem *)sender;

@end


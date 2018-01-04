//
//  ViewController.m
//  Obj-C 2-6-2
//
//  Created by Jack Wong on 2017/12/27.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scheme;

@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(displayLaunchDetails) name:UIApplicationDidBecomeActiveNotification object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayLaunchDetails{
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (appdelegate.scheme != nil){
        self.scheme.text = appdelegate.scheme;
    };
    if (appdelegate.host != nil){
        self.captionLabel.text = appdelegate.caption;
        self.commentLabel.text = appdelegate.comment;
    };
}

@end

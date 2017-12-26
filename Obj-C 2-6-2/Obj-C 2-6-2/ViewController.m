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
@property (weak, nonatomic) IBOutlet UILabel *host;

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
        self.host.text = appdelegate.host;
    };
}
//-(void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
//};
//




- (IBAction)passPara:(id)sender {
    
    NSString *customURL = @"stv://caption=ABC&comment=AAA";
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

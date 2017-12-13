//
//  ViewController.m
//  Obj-C 2-1-19
//
//  Created by Jack Wong on 2017/12/12.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)passDataToSecondVC:(id)sender;


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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"segue"]){
        SecondViewController *secondVC = (SecondViewController *)segue.destinationViewController;
     secondVC.tempText = self.textField.text;
    }
}

- (IBAction)passDataToSecondVC:(id)sender {
    
    
    [self performSegueWithIdentifier:@"segue" sender:self];
    
}
@end

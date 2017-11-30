//
//  ViewController.m
//  Obj-C 2-1-3
//
//  Created by Jack Wong on 2017/11/23.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)changeBackground:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (weak, nonatomic) IBOutlet UIButton *backgroundButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeBackground:(UIButton *)sender {
    
    self.backgroundImage.image = [UIImage imageNamed:[ NSString stringWithFormat:@"photo%u.jpg", 1+arc4random_uniform(5)]];
    
}
@end

//
//  ViewController.m
//  Obj-C 2-4-8
//
//  Created by Jack Wong on 2017/12/26.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIDocumentInteractionControllerDelegate>

@property UIDocumentInteractionController *docController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self instaPostImage];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)instaPostImage{
    
    NSURL *url = [NSURL URLWithString:@"http://weather.livedoor.com/img/icon/1.gif"];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
    UIImage *imageShare = [[UIImage alloc] initWithData: imageData];
    NSURL * instagramURL = [NSURL URLWithString:@"instagram://app"];
    
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL])
    {
        UIImage *imageToUse = imageShare;
        NSString *documentDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString *saveImagePath = [documentDirectory stringByAppendingPathComponent:@"Image.png"];
        NSData *imageData = UIImagePNGRepresentation(imageToUse);
        [imageData writeToFile:saveImagePath atomically:YES];
        NSURL *imageURL = [NSURL fileURLWithPath:saveImagePath];
        self.docController = [[UIDocumentInteractionController alloc] init];
        self.docController = [UIDocumentInteractionController interactionControllerWithURL:imageURL];
        self.docController.delegate = self;
        self.docController.annotation = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"Testing"],@"InstagramCaption", nil];
        self.docController.UTI = @"com.instagram.exclusivegram";
        UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
        [self.docController presentOpenInMenuFromRect:CGRectMake(1, 1, 1, 1) inView:vc.view animated:YES];
    } else {
        NSLog(@"Failed");
    }

}

@end

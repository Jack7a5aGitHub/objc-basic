//
//  ViewController.m
//  Obj-C 2-5-1
//
//  Created by Jack Wong on 2017/12/19.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "MessageUI/MessageUI.h"
#import "MessageUI/MFMailComposeViewController.h"

@interface ViewController ()<MFMailComposeViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the mail");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved the mail");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancel sending mail");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Failed Error");
            break;
        default:
            NSLog(@"Error");
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)sendEmail:(id)sender {
    
   if ([MFMailComposeViewController canSendMail]){
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc]init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"アプリから送信"];
        [mail setMessageBody:@"ここに本文を入力してください" isHTML:NO];
        [mail setToRecipients:@[@"jack7a5a93@gmail.com"]];
        
        [self presentViewController: mail animated: YES completion:nil];
    } else {
        NSLog(@"Nothing can send");
    }
}


@end

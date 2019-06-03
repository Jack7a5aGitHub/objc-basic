//
//  ViewController.m
//  Obj-C 2-4-6
//
//  Created by Jack Wong on 2017/12/29.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "FBSDKShareKit/FBSDKShareKit.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property UIImage *imageFromLibrary;

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
- (IBAction)shareUrl:(id)sender {
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    
    content.contentURL = [NSURL URLWithString:@"https://developers.facebook.com"];
    NSLog(@"Success to share Url");
    [FBSDKShareDialog showFromViewController:self
                                 withContent:content
                                    delegate:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
  
    [picker dismissViewControllerAnimated:YES completion:^{
        FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
        photo.image = image;
        photo.userGenerated = YES;
        FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
        content.photos = @[photo];
        [FBSDKShareDialog showFromViewController:self
                                     withContent:content
                                        delegate:nil];
    }
    ];
   
   
}
- (IBAction)sharePhoto:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
    NSLog(@"Get Photo");
    
    
}
@end

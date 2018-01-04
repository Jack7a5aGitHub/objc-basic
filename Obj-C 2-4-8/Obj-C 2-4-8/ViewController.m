//
//  ViewController.m
//  Obj-C 2-4-8
//
//  Created by Jack Wong on 2017/12/26.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "Photos/Photos.h"

@interface ViewController ()<UIDocumentInteractionControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property UIDocumentInteractionController *doc;

@property UIImagePickerController *imagePicker;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property NSData *imgData;

@property UIImage *getImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.getImage = [UIImage imageNamed:@"photo0"];
    self.imgData = UIImageJPEGRepresentation(self.getImage, 0.75f);
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image.igo"];
    [self.imgData writeToFile:filePath atomically:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
//    self.getImage = info[UIImagePickerControllerOriginalImage];
//    self.imgData = UIImageJPEGRepresentation(self.getImage, 0.75f);
//    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getImage.igo"];
//    [self.imgData writeToFile:filePath atomically:YES];
//    self.imageView.image = [UIImage imageWithData:self.imgData];
//    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
//}
- (IBAction)getPhoto:(id)sender {
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePicker.delegate = self;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (IBAction)shareToIG:(id)sender {
    
//    NSURL *instagramURL = [NSURL URLWithString:@"instagram://app"];
//    if([[UIApplication sharedApplication] canOpenURL:instagramURL])
//    {
//        CGFloat cropVal = (self.imageView.image.size.height > self.imageView.image.size.width ? self.imageView.image.size.width : self.imageView.image.size.height);
//
//        cropVal *= [self.imageView.image scale];
//
//        CGRect cropRect = (CGRect){.size.height = cropVal, .size.width = cropVal};
//        CGImageRef imageRef = CGImageCreateWithImageInRect([self.imageView.image CGImage], cropRect);
//
//        NSData *imageData = UIImageJPEGRepresentation([UIImage imageWithCGImage:imageRef], 1.0);
//        CGImageRelease(imageRef);
//
//        NSString *writePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"instagram.igo"];
//        if (![imageData writeToFile:writePath atomically:YES]) {
//            // failure
//            NSLog(@"image save failed to path %@", writePath);
//            return;
//        } else {
//            // success.
//        }
//
//        // send it to instagram.
//        NSURL *fileURL = [NSURL fileURLWithPath:writePath];
//        self.doc = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
//        self.doc.delegate = self;
//        [self.doc setUTI:@"com.instagram.exclusivegram"];
//        [self.doc setAnnotation:@{@"InstagramCaption" : @"We are making fun"}];
//        [self.doc presentOpenInMenuFromRect:CGRectMake(0, 0, 320, 480) inView:self.view animated:YES];
//    }
//    else
//    {
//        NSLog (@"Instagram not found");
//
//    }
//
    
    
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image.igo"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    
    
//    NSString *imagePath = [NSString stringWithFormat:@"%@/image.igo", [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]];
//    [[NSFileManager defaultManager]removeItemAtPath:imagePath error:nil ];
//    [UIImagePNGRepresentation(self.imageView.image) writeToFile:imagePath atomically:YES];
    self.doc = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    self.doc.UTI = @"com.instagram.exclusivegram";
     self.doc.delegate = self;
  //  [self.doc presentOpenInMenuFromRect:self.view.frame inView:self.view animated:YES];
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:@"instagram://app"];
    [application openURL:URL options:@{} completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"Opened url");
            [self.doc presentOpenInMenuFromRect:self.view.frame inView:self.view animated:YES];
        }
    }];
}
@end

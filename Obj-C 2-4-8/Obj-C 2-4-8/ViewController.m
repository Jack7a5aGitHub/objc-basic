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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    self.getImage = info[UIImagePickerControllerOriginalImage];
    self.imgData = UIImageJPEGRepresentation(self.getImage, 0.75f);
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getImage.igo"];
    [self.imgData writeToFile:filePath atomically:YES];
    self.imageView.image = [UIImage imageWithData:self.imgData];
    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)getPhoto:(id)sender {
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePicker.delegate = self;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (IBAction)shareToIG:(id)sender {
    
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getImage.igo"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    
    self.doc = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    self.doc.UTI = @"com.instagram.exclusivegram";
     self.doc.delegate = self;
    [self.doc presentOpenInMenuFromRect:self.view.frame inView:self.view animated:YES];

}
@end

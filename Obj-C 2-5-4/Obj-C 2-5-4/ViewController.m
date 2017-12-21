//
//  ViewController.m
//  Obj-C 2-5-4
//
//  Created by Jack Wong on 2017/12/20.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "CoreImage/CoreImage.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *getImage = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = getImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)getPhoto:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)filterImage:(id)sender {
    CIImage *beginImage = [CIImage imageWithCGImage:[self.imageView.image CGImage]];
    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *cifilter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:kCIInputImageKey, beginImage,@"inputIntensity", @0.8f,nil];
    CIImage *resultImage = [cifilter outputImage];
    CGImageRef cgimg = [context createCGImage:resultImage fromRect:[resultImage extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];
    [self.imageView setImage:newImg];
    CGImageRelease(cgimg);
}

@end

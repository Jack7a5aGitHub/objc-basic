//
//  ViewController.m
//  Obj-C 2-5-5
//
//  Created by Jack Wong on 2017/12/27.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "CoreImage/CoreImage.h"

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

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
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *tokenImage = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = tokenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)takePhoto:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

- (IBAction)filter:(id)sender {
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

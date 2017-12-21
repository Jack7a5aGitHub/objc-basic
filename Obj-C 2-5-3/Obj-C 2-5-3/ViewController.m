//
//  ViewController.m
//  Obj-C 2-5-3
//
//  Created by Jack Wong on 2017/12/19.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "AVFoundation/AVFoundation.h"
#import "CoreImage/CoreImage.h"


@interface ViewController ()<AVCapturePhotoCaptureDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property AVCaptureSession *session;

@property AVCapturePhotoOutput *photoOutput;

@property AVCapturePhotoSettings *photoSetting;

@property AVCaptureVideoPreviewLayer *previewLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
-(void)viewWillAppear:(BOOL)animated{
    self.session = [[AVCaptureSession alloc]init];
    self.session.sessionPreset = AVCaptureSessionPresetPhoto;
    self.photoOutput = [[AVCapturePhotoOutput alloc]init];
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    [self.session addInput:input];
    self.photoOutput = [[AVCapturePhotoOutput alloc]init];
    [self.session addOutput:self.photoOutput];
    [self.session startRunning];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)captureOutput:(AVCapturePhotoOutput *)output didFinishProcessingPhoto:(AVCapturePhoto *)photo error:(NSError *)error{
    
    NSData *imageData = [photo fileDataRepresentation];
    self.imageView.image = [UIImage imageWithData:imageData];
    
}

- (IBAction)takePhoto:(id)sender {
    self.photoSetting = [[AVCapturePhotoSettings alloc]init];
    self.photoSetting.flashMode = AVCaptureFlashModeAuto;
    [self.photoSetting isAutoDualCameraFusionEnabled];
    [self.photoOutput capturePhotoWithSettings:self.photoSetting delegate:self];

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

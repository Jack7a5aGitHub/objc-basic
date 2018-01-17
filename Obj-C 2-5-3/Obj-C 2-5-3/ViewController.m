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


@interface ViewController ()<AVCapturePhotoCaptureDelegate,AVCaptureVideoDataOutputSampleBufferDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property AVCaptureSession *session;

@property AVCapturePhotoOutput *photoOutput;

@property AVCapturePhotoSettings *photoSetting;

@property AVCaptureVideoPreviewLayer *previewLayer;

@property CALayer *rootLayer;
@property (weak, nonatomic) IBOutlet UIView *previewView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
-(void)viewWillAppear:(BOOL)animated{
    self.session = [[AVCaptureSession alloc]init];
    self.session.sessionPreset = AVCaptureSessionPresetMedium;
    self.photoOutput = [[AVCapturePhotoOutput alloc]init];
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    [self.session addInput:input];
//    AVCaptureVideoDataOutput *videoDataOutput = [[AVCaptureVideoDataOutput alloc]init];
//    dispatch_queue_t videoDataOutputQueue = dispatch_queue_create("capture session queue", NULL);
//    [videoDataOutput setSampleBufferDelegate:self queue:videoDataOutputQueue];
//    videoDataOutput.alwaysDiscardsLateVideoFrames = YES;
//    [self.session addOutput:videoDataOutput];
//    [videoDataOutput connectionWithMediaType:AVMediaTypeVideo];
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.session];
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    self.rootLayer = self.previewView.layer;
    self.rootLayer.masksToBounds = YES;
    self.previewLayer.frame = self.rootLayer.bounds;
    [self.rootLayer addSublayer:self.previewLayer];
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
    self.previewView.hidden = YES;
    
    
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

//
//  ViewController.m
//  Obj-C 2-5-6
//
//  Created by Jack Wong on 2017/12/21.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "CoreLocation/CoreLocation.h"

@interface ViewController ()<CLLocationManagerDelegate>

@property CLLocationManager *locationManager;

@property CLGeocoder *geocoder;

@property CLPlacemark *placemark;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.geocoder = [[CLGeocoder alloc]init];
    if (self.locationManager == nil){
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.delegate = self;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        NSLog(@"not nil");
    }
    [self.locationManager requestAlwaysAuthorization];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    [self.locationManager startUpdatingLocation];
    CLLocation *currentLocation = self.locationManager.location;
    NSString *latitude = @(currentLocation.coordinate.latitude).stringValue;
    NSString *longitude = @(currentLocation.coordinate.longitude).stringValue;
    NSLog(@"Latitude %@",latitude);
    NSLog(@"Longitude %@",longitude);
}
//-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
//    [self.locationManager startUpdatingLocation];
//    NSString *latitude = [[NSString alloc]initWithFormat:@"%f", newLocation.coordinate.latitude];
//    NSLog(@"%@", latitude);
//    NSString *longitude = [[NSString alloc]initWithFormat:@"%f", newLocation.coordinate.longitude];
//    NSLog(@"%@", longitude);
//}
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
//
//    CLLocation *newLocation = [locations lastObject];
//
// [self.geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
//
//     if (error == nil&& [placemarks count] >0) {
//            self.placemark = [placemarks lastObject];
//
//            NSString *latitude = [NSString stringWithFormat:@"%f",newLocation.coordinate.latitude];
//            NSString *longitude = [NSString stringWithFormat:@"%f",newLocation.coordinate.longitude];
//         NSLog(@"%@", latitude);
//         NSLog(@"%@", longitude);
//
//        } else {
//            NSLog(@"%@", error.debugDescription);
//        }
//
//    }];
//
//    [self.locationManager stopUpdatingLocation];
//}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Cannot find the location.");

}

@end

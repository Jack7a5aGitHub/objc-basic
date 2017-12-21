//
//  ViewController.m
//  Obj-C 2-5-7
//
//  Created by Jack Wong on 2017/12/21.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"

@interface ViewController ()<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property CLLocationCoordinate2D coor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    self.coor = CLLocationCoordinate2DMake(35.623655, 139.724858);
    [self.mapView setCenterCoordinate:self.coor animated:NO];
    
    MKCoordinateRegion region = self.mapView.region;
    region.center = self.coor;
    region.span.latitudeDelta = 0.02;
    region.span.longitudeDelta = 0.02;
    [self.mapView setRegion:region animated:NO];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = self.coor;
    point.title = @"Where am I?";
    point.subtitle = @"Smart Tech Ventures";
    
    [self.mapView addAnnotation:point];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
}

@end

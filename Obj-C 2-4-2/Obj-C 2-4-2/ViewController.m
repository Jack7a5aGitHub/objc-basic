//
//  ViewController.m
//  Obj-C 2-4-2
//
//  Created by Jack Wong on 2017/12/27.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Weather.h"

@interface ViewController ()

@property NSMutableArray *weatherDatasArray;


@end

static  NSString * const BaseUrlString = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)stringByReplacingUnicodePoint:(id)jsonObj
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:jsonObj options:0 error:nil];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return result;
}

- (IBAction)forecasts:(id)sender {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *jsonString = BaseUrlString;
    NSURL *url = [NSURL URLWithString:jsonString];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject ) {
        self.weatherDatasArray = [NSMutableArray new];
        {
            for (NSDictionary<NSString *, NSString *> *forecasts in responseObject[@"forecasts"]) {
                
                Weather *weather = [Weather new];
                weather.dateLabel = forecasts[@"dateLabel"];
                weather.telop = forecasts[@"telop"];
                weather.date = forecasts[@"date"];
                weather.imageUrl = [forecasts valueForKeyPath:@"image.url"];
                [self.weatherDatasArray addObject:weather];
            }
            //NSLog(@"%@", [self stringByReplacingUnicodePoint:responseObject[@"forecasts"]]);
          
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }
     ];
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Please select one of the actions" preferredStyle:UIAlertControllerStyleActionSheet];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"今日" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        for (Weather *weather in self.weatherDatasArray){
            if ([weather.dateLabel  isEqual: @"今日"]){
                NSLog(@"%@の天気は%@です。", weather.dateLabel, weather.telop);
            }
            
        }}]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"明日" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        for (Weather *weather in self.weatherDatasArray){
            if ([weather.dateLabel  isEqual: @"明日"]){
                NSLog(@"%@の天気は%@です。", weather.dateLabel, weather.telop);
            }
            
        }
    }]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"明後日" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        for (Weather *weather in self.weatherDatasArray){
            if ([weather.dateLabel  isEqual: @"明後日"]){
                NSLog(@"%@の天気は%@です。", weather.dateLabel, weather.telop);
            }
            
        }
    }]];
    [self presentViewController:actionSheet animated: YES completion:nil];
    
}

@end

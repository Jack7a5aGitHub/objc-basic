//
//  ViewController.m
//  Obj-C 2-4-1
//
//  Created by Jack Wong on 2017/12/23.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "Weather.h"
#import "CustomTableViewCell.h"
#import "AFNetworking.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *weatherDatas;

@end

static  NSString * const BaseUrlString = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.weatherDatas = [[NSMutableArray alloc]init];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self parseJson];
    [self.tableView reloadData];
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

-(void)parseJson
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:BaseUrlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject ) {
        
        {
            for (NSDictionary<NSString *, NSString *> *forecasts in responseObject[@"forecasts"]) {
                
                Weather *weather = [[Weather alloc]init];
                weather.dateLabel = forecasts[@"dateLabel"];
                weather.telop = forecasts[@"telop"];
                weather.date = forecasts[@"date"];
                weather.imageUrl = [forecasts valueForKeyPath:@"image.url"];
                [self.weatherDatas addObject:weather];
            }
                        NSLog(@"%@", [self stringByReplacingUnicodePoint:responseObject[@"forecasts"]]);
                        for (Weather *weather in self.weatherDatas) {
            
                            NSLog(@"%@の天気は%@です%@  %@。", weather.dateLabel, weather.telop, weather.date, weather.imageUrl);
            
                        }
                    }
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }
     ];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.weatherDatas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    CustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Weather *weather = self.weatherDatas[indexPath.row];
    NSLog(@"%@", weather);
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:weather.imageUrl]];
    cell.intro.text = [NSString stringWithFormat:@"%@の天気です。", weather.dateLabel ];
    cell.date.text = weather.date;
    cell.telop.text = weather.telop;
    cell.image.image = [UIImage imageWithData:imageData];
    NSLog(@"%@", weather.dateLabel);
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
@end
//- (IBAction)getJson:(id)sender {
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    NSString *jsonString = BaseUrlString;
//    NSURL *url = [NSURL URLWithString:jsonString];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//
//    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject ) {
//        self.weatherDatas = [NSMutableArray new];
//        {
//           for (NSDictionary<NSString *, NSString *> *forecasts in responseObject[@"forecasts"]) {
//
//               Weather *weather = [Weather new];
//               weather.dateLabel = forecasts[@"dateLabel"];
//               weather.telop = forecasts[@"telop"];
//               weather.date = forecasts[@"date"];
//               weather.imageUrl = [forecasts valueForKeyPath:@"image.url"];
//               [self.weatherDatas addObject:weather];
//           }
////            NSLog(@"%@", [self stringByReplacingUnicodePoint:responseObject[@"forecasts"]]);
////            for (Weather *weather in self.weatherDatas) {
////
////                NSLog(@"%@の天気は%@です。", weather.dateLabel, weather.telop);
////
////            }
////        }
//        }} failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }
//];
//
//    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Please select one of the actions" preferredStyle:UIAlertControllerStyleActionSheet];
//    [actionSheet addAction:[UIAlertAction actionWithTitle:@"今日" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
//        for (Weather *weather in self.weatherDatas){
//            if ([weather.dateLabel  isEqual: @"今日"]){
//                NSLog(@"%@の天気は%@です。", weather.dateLabel, weather.telop);
//        }
//
//        }}]];
//    [actionSheet addAction:[UIAlertAction actionWithTitle:@"明日" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
//
//        for (Weather *weather in self.weatherDatas){
//            if ([weather.dateLabel  isEqual: @"明日"]){
//                NSLog(@"%@の天気は%@です。", weather.dateLabel, weather.telop);
//            }
//
//        }
//    }]];
//    [actionSheet addAction:[UIAlertAction actionWithTitle:@"明後日" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
//
//        for (Weather *weather in self.weatherDatas){
//            if ([weather.dateLabel  isEqual: @"明後日"]){
//                NSLog(@"%@の天気は%@です。", weather.dateLabel, weather.telop);
//            }
//
//        }
//    }]];
//    [self presentViewController:actionSheet animated: YES completion:nil];
//
//}

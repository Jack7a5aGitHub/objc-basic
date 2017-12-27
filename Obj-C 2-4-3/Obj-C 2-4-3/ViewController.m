//
//  ViewController.m
//  Obj-C 2-4-3
//
//  Created by Jack Wong on 2017/12/27.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Weather.h"
#import "CustomTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *weatherDatasArray;

@end

static  NSString * const BaseUrlString = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated{
    [self parseJson];
    [self.tableView reloadData];
}
-(void)parseJson
{
    self.weatherDatasArray = [[NSMutableArray alloc]init];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:BaseUrlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject ) {
        
        {
            
            for (NSDictionary<NSString *, NSString *> *forecasts in responseObject[@"forecasts"]) {
                
                                Weather *weather = [[Weather alloc]init];
                                weather.dateLabel = forecasts[@"dateLabel"];
                                weather.telop = forecasts[@"telop"];
                                weather.date = forecasts[@"date"];
                                weather.imageUrl = [forecasts valueForKeyPath:@"image.url"];
                                [self.weatherDatasArray addObject:weather];
               
              
            }
            //NSLog(@"%@", [self stringByReplacingUnicodePoint:responseObject[@"forecasts"]]);
            
            [self.tableView reloadData];
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }
     ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.weatherDatasArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Weather *weather = self.weatherDatasArray[indexPath.row];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:weather.imageUrl]];
    cell.dateLabel.text = [NSString stringWithFormat:@"%@の天気です。", weather.dateLabel ];
    cell.date.text = weather.date;
    cell.telop.text = weather.telop;
    cell.image.image = [UIImage imageWithData:imageData];
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
@end

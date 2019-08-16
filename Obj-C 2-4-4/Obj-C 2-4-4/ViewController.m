//
//  ViewController.m
//  Obj-C 2-4-4
//
//  Created by Jack Wong on 2017/12/27.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "Weather.h"
#import "CustomTableViewCell.h"
#import "AFNetworking.h"
#import "sqlite3.h"
#import "FMDatabase.h"

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
    dispatch_async(dispatch_get_main_queue(), ^{
        [self createDatabase];
    });
}
-(void)viewWillAppear:(BOOL)animated{
    [self parseJsonAndSaveIntoDB];
    
    [self retrieveDataFromDB];
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
-(void)createDatabase{
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = docPaths[0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"UserDatabase5.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:databasePath];
    NSString *sqlite = @"CREATE TABLE IF NOT EXISTS weatherTable2 (weather_id INTEGER PRIMARY KEY DEFAULT NULL,weatherDate TEXT DEFAULT NULL,weatherTelop TEXT DEFAULT NULL,iconUrl TEXT DEFAULT NULL)";
    NSString *unique = @"CREATE UNIQUE INDEX IF NOT EXISTS idx_weatherTable2_weatherDate ON weatherTable2 (weatherDate)";
    [database open];
    [database executeUpdate:sqlite];
    [database executeUpdate:unique];
    [database close];
}
-(void)retrieveDataFromDB{
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = docPaths[0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"UserDatabase5.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:databasePath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM weatherTable2"];
    self.weatherDatasArray = [[NSMutableArray alloc]init];
    
    while([results next]){
        Weather *weather = [[Weather alloc]init];
        
        weather.date = [results stringForColumn:@"weatherDate"];
        weather.telop = [results stringForColumn:@"weatherTelop"];
        weather.imageUrl = [results stringForColumn:@"iconUrl"];
        [self.weatherDatasArray addObject:weather];
    }
    [results close];
    [database close];
    [self.tableView reloadData];
}

-(void)parseJsonAndSaveIntoDB
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:BaseUrlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject ) {
        
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *directory = paths[0];
            NSString *databasePath = [directory stringByAppendingPathComponent:@"UserDatabase5.sqlite"];
            FMDatabase *database = [FMDatabase databaseWithPath:databasePath];
            for (NSDictionary<NSString *, NSString *> *forecasts in responseObject[@"forecasts"]) {
                
                NSString *insert = [[NSString alloc] initWithFormat:@"INSERT OR REPLACE INTO weatherTable2(weatherDate, weatherTelop, iconUrl) VALUES('%@','%@','%@')", forecasts[@"date"], forecasts[@"telop"], [forecasts valueForKeyPath:@"image.url"]];
                [database open];
                [database executeUpdate:insert];
                [database close];
            }
            //NSLog(@"%@", [self stringByReplacingUnicodePoint:responseObject[@"forecasts"]]);
            
            [self.tableView reloadData];
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }
     ];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.weatherDatasArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Weather *weather = self.weatherDatasArray[indexPath.row];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:weather.imageUrl]];
    
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

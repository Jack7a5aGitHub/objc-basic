//
//  model.m
//  Obj-C 2-4-5
//
//  Created by Jack Wong on 2017/12/30.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "model.h"
#import "ViewController.h"

@implementation model

-(NSString*)stringByReplacingUnicodePoint:(id)jsonObj
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:jsonObj options:0 error:nil];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return result;
}

+(void)createDatabase{
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
    // NSLog(@"%@", databasePath);
}

+(void)retrieveDataFromDB{
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = docPaths[0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"UserDatabase5.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:databasePath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM weatherTable2"];
    ViewController *vc = [[ViewController alloc]init];
    vc.weatherDatasArray = [[NSMutableArray alloc]init];
    while([results next]){
        model *modelData = [[model alloc]init];
        modelData.date = [results stringForColumn:@"weatherDate"];
        modelData.telop = [results stringForColumn:@"weatherTelop"];
        modelData.imageUrl = [results stringForColumn:@"iconUrl"];
        [vc.weatherDatasArray addObject:modelData];
        NSLog(@"%@", vc.weatherDatasArray);
        
    }
    for (model *modelData in vc.weatherDatasArray) {
        
        NSLog(@"%@の天気は%@です。%@", modelData.date, modelData.telop,modelData.imageUrl);
        
    }
    [results close];
    [database close];
    [vc.tableView reloadData];
}

+(void)parseJsonAndSaveIntoDB
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:BaseUrlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject ) {
        
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
            ViewController *vc = [[ViewController alloc]init];
            [vc.tableView reloadData];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }
     ];
}


@end

//
//  model.h
//  Obj-C 2-4-5
//
//  Created by Jack Wong on 2017/12/30.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "sqlite3.h"
#import "FMDatabase.h"
#import "Data.h"

@protocol DataModelDelegate<NSObject>

-(void)reloadData;

@end

@interface model : NSObject

@property(weak, nonatomic) id<DataModelDelegate> delegate;

@property NSMutableArray *weatherDatasArray;

-(void)createDatabase;

-(void)retrieveDataFromDB;

-(void)parseJsonAndSaveIntoDB;

@end

static  NSString * const BaseUrlString = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";


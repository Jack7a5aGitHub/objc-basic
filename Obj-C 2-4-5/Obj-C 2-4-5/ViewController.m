//
//  ViewController.m
//  Obj-C 2-4-5
//
//  Created by Jack Wong on 2017/12/30.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "model.h"
#import "CustomTableViewCell.h"
#import "TableViewProvider.h"

@interface ViewController ()<UITableViewDelegate,DataModelDelegate>

@property TableViewProvider *provider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    model *dataModel = [[model alloc]init];
    dataModel.delegate = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [dataModel createDatabase];
    });
    [dataModel parseJsonAndSaveIntoDB];
    self.tableView.delegate = self;
    self.provider = [[TableViewProvider alloc]init];
    self.tableView.dataSource = self.provider;

}

-(void)viewWillAppear:(BOOL)animated{
    model *dataModel = [[model alloc]init];
    [dataModel parseJsonAndSaveIntoDB];
    [dataModel retrieveDataFromDB];
    self.provider.dataList = dataModel.weatherDatasArray;
    
    NSLog(@"dataList %@", self.provider.dataList);
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadData{
    [self.tableView reloadData];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

@end

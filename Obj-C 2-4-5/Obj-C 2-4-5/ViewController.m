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

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property model *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_async(dispatch_get_main_queue(), ^{
        [model createDatabase];
    });
  //  [model parseJsonAndSaveIntoDB];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated{
   
    [model parseJsonAndSaveIntoDB];
    [model retrieveDataFromDB];
    [self.tableView reloadData];
    
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
    model *modelData = self.weatherDatasArray[indexPath.row];
    
    NSBlockOperation *loadImageOperation = [[NSBlockOperation alloc] init];
    __weak NSBlockOperation *weakOperation = loadImageOperation;
    [loadImageOperation addExecutionBlock:^(void){
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:modelData.imageUrl]];
        UIImage *imageReceived = [UIImage imageWithData:imageData];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^(void) {
 
            if (! weakOperation.isCancelled)
            {
                CustomTableViewCell *theCell = (CustomTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
                theCell.imageView.image = imageReceived;
                theCell.dateLabel.text = modelData.date;
                theCell.telopLabel.text = modelData.telop;
                
            }
        }];
    }];
    
//    cell.dateLabel.text = modelData.date;
//    cell.telopLabel.text = modelData.telop;
//    cell.imgView.image = imageReceived;
    
    return cell;
    
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

@end

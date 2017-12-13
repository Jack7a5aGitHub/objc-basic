//
//  ViewController.m
//  Obj-C 2-1-10
//
//  Created by Jack Wong on 2017/12/05.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSArray *tableArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    tableView.delegate = self;
    tableView.dataSource = self;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TableViewList" ofType:@"plist"];
    NSArray *contentArray = [NSArray arrayWithContentsOfFile:path];
    self.tableArray = [[NSMutableArray alloc]initWithArray:contentArray copyItems:YES];
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 60;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.tableArray objectAtIndex:indexPath.row]valueForKey:@"name"];
    NSString *imageName = [[self.tableArray objectAtIndex:indexPath.row]valueForKey:@"photo"];
    cell.imageView.image = [UIImage imageNamed:imageName];
    return cell;
    
    
}

@end

//
//  ViewController.m
//  Obj-C 2-1-14
//
//  Created by Jack Wong on 2017/12/14.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property NSDictionary *plistDict;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSArray *labelArray;

@property NSArray *imageArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TableViewList" ofType:@"plist"];
    self.plistDict = [NSDictionary dictionaryWithContentsOfFile:path];
    self.labelArray = [self.plistDict valueForKey:@"name"];
    self.imageArray = [self.plistDict valueForKey:@"photo"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 60;
    self.navigationItem.title = @"ナビゲーションバー";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.labelArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.labelArray[indexPath.row];
    NSString *imageName = self.imageArray [indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imageName];
    return cell;
    
}


@end

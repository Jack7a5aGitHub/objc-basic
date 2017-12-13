//
//  ViewController.m
//  Obj-C 2-1-11
//
//  Created by Jack Wong on 2017/12/06.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSArray* tableArray;

@property NSArray* sectionTitleA;

@property NSArray* sectionTitleB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TableViewList" ofType:@"plist"];
    NSArray *contentArray = [NSArray arrayWithContentsOfFile:path];
    self.tableArray = [[NSMutableArray alloc]initWithArray:contentArray copyItems:YES];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 60;
    self.sectionTitleA = [self.tableArray valueForKey:@"groupA"];
    self.sectionTitleB = [self.tableArray valueForKey:@"groupB"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.tableArray objectAtIndex:indexPath.row]valueForKey:@"name"];
    NSString *imageName = [[self.tableArray objectAtIndex:indexPath.row]valueForKey:@"photo"];
    cell.imageView.image = [UIImage imageNamed:imageName];
    return cell;

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.sectionTitleA objectAtIndex:section];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

@end

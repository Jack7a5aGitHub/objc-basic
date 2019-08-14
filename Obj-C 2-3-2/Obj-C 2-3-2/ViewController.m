//
//  ViewController.m
//  Obj-C 2-3-2
//
//  Created by Jack Wong on 2017/12/13.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"
#import "FMDatabase.h"
#import "todoRegisterVC.h"
#import "CustomTableViewCell.h"
#import "MyObject.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView* tableView;

@property NSMutableArray *groupArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = docPaths[0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"UserDatabase3.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:databasePath];
    NSString *sqlite = @"CREATE TABLE IF NOT EXISTS tr_todo (todo_id INTEGER PRIMARY KEY DEFAULT NULL,todo_title TEXT DEFAULT NULL,todo_contents TEXT DEFAULT NULL,created DATE DEFAULT NULL,modified DATE DEFAULT NULL,limit_date DATE DEFAULT NULL,stringLimit_date TEXT DEFAULT NULL,delete_flg TEXT DEFAULT NULL)";
    [database open];
    [database executeUpdate:sqlite];
    [database close];
}

-(void)viewWillAppear:(BOOL)animated{
    [self retrieveData];
    //[self sortingLimit];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)retrieveData {
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = docPaths[0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"UserDatabase3.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:databasePath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tr_todo ORDER BY limit_date ASC"];
    self.groupArray = [[NSMutableArray alloc]init];
 
    while([results next]){
        MyObject *obj = [[MyObject alloc]init];
        
        obj.titleText = [results stringForColumn:@"todo_title"];
        obj.stringLimit = [results stringForColumn:@"stringLimit_date"];
        obj.limit = [results dateForColumn:@"limit_date"];
        [self.groupArray addObject:obj];
        
        
    }
    [results close];
    [database close];

    NSLog(@"%@", self.groupArray);
    
}

- (IBAction)transformToRegisterVC:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"secondStoryboard" bundle:nil];
    todoRegisterVC *todoRegVC = [storyboard instantiateViewControllerWithIdentifier:@"registerVC"];
    [self.navigationController pushViewController:todoRegVC animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.groupArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *tableViewCell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    MyObject *object = self.groupArray[indexPath.row];
    
    tableViewCell.titleLabel.text = object.titleText;
    tableViewCell.limitLabel.text = object.stringLimit;

    return tableViewCell;

}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        MyObject *object = self.groupArray[indexPath.row];
        NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = docPaths[0];
        NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"UserDatabase3.sqlite"];

        FMDatabase *database = [FMDatabase databaseWithPath:databasePath];
        NSString *delete = [[NSString alloc] initWithFormat:@"DELETE FROM tr_todo WHERE todo_title= ?"];
        [database open];
        [database executeUpdate:delete, [NSString stringWithFormat:@"%@", object.titleText]];
        [database close];
        [self.groupArray removeObjectAtIndex:indexPath.row];
    }
    [self.tableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
@end


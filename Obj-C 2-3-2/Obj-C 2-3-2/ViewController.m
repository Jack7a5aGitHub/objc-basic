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

@property NSMutableArray *titleArray;

@property NSMutableArray *limitArray;

@property NSMutableArray *dateStringArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

//    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = docPaths[0];
//    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"UserDatabase3.sqlite"];
//    FMDatabase *database = [FMDatabase databaseWithPath:databasePath];
//    NSString *sqlite = @"CREATE TABLE tr_todo (todo_id INTEGER PRIMARY KEY DEFAULT NULL,todo_title TEXT DEFAULT NULL,todo_contents TEXT DEFAULT NULL,created DATE DEFAULT NULL,modified DATE DEFAULT NULL,limit_date DATE DEFAULT NULL,stringLimit_date TEXT DEFAULT NULL,delete_flg TEXT DEFAULT NULL)";
//    [database open];
//    [database executeUpdate:sqlite];
//    [database close];
}

-(void)viewWillAppear:(BOOL)animated{
    [self retrieveData];
    //[self sortingLimit];
    //[self formatLimitArray];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)sortingLimit{
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"dateOrder" ascending:NO];
//    [self.limitArray sortedArrayUsingDescriptors:[NSMutableArray arrayWithObject:sortDescriptor]];
//    [self.limitArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//    NSLog(@"%@", self.limitArray);
//}

-(void)retrieveData {
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = docPaths[0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"UserDatabase3.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:databasePath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tr_todo"];
    self.limitArray = [[NSMutableArray alloc]init];
    self.titleArray = [[NSMutableArray alloc]init];
    while([results next]){
        
        NSDictionary *dbDictionary = [results resultDictionary];
        [self.limitArray addObject:dbDictionary[@"stringLimit_date"]];
        [self.titleArray addObject:dbDictionary[@"todo_title"]];
    
        //        NSLog(@"%@", self.titleArray);
        //        NSLog(@"%@", self.contentArray);
        //        NSLog(@"%@", self.limitArray);
    }
    [results close];
    [database close];
    NSLog(@"%@", self.titleArray);
    NSLog(@"%@", self.limitArray);
    
}
//-(void)formatLimitArray{
//    if (self.limitArray.count >0){
//        self.dateStringArray = [[NSMutableArray alloc]init];
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//        [dateFormatter setDateFormat:@"dd/MM/YYYY"];
//        for (int i=0; i< self.limitArray.count; i++){
//            NSString *dateString = [dateFormatter stringFromDate:[self.limitArray objectAtIndex:i]];
//            [self.dateStringArray addObject:dateString.description];
//        }
//        NSLog(@"%@", self.dateStringArray);
//    }
//
//}

- (IBAction)transformToRegisterVC:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"secondStoryboard" bundle:nil];
    todoRegisterVC *todoRegVC = [storyboard instantiateViewControllerWithIdentifier:@"registerVC"];
    [self.navigationController pushViewController:todoRegVC animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *tableViewCell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    tableViewCell.titleLabel.text = self.titleArray[indexPath.row];
    tableViewCell.limitLabel.text = self.limitArray[indexPath.row];

    return tableViewCell;

}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = docPaths[0];
        NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"UserDatabase3.sqlite"];

        FMDatabase *database = [FMDatabase databaseWithPath:databasePath];
        NSString *delete = [[NSString alloc] initWithFormat:@"DELETE FROM tr_todo WHERE todo_title= ?"];
        [database open];
        [database executeUpdate:delete, [NSString stringWithFormat:@"%@", self.titleArray[indexPath.row]]];
        [database close];
        [self.titleArray removeObjectAtIndex:indexPath.row];
    }
    [self.tableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
@end


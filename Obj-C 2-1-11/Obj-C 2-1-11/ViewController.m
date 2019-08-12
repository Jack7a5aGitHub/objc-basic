//
//  ViewController.m
//  Obj-C 2-1-11
//
//  Created by Jack Wong on 2017/12/06.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSUInteger, Class){
    frutis,
    photos,
};


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSArray* photoArray;

@property NSArray* fruitArray;

@property NSDictionary* plistDictionary;

@property NSArray *sectionArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TableViewList" ofType:@"plist"];
    self.sectionArray = self.plistDictionary.allKeys;
    self.plistDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    self.photoArray = [self.plistDictionary valueForKey:@"Photos"];
    self.fruitArray = [self.plistDictionary valueForKey:@"Fruits"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = 0;
    switch (section) {
        case photos:
            rows = self.photoArray.count;
            break;
        case frutis:
            rows = self.fruitArray.count;
            break;
            default:
            break;
            
    }
    return rows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *itemName;
    
    switch (indexPath.section){
        case photos:
            itemName = self.photoArray[indexPath.row];
            break;
        case frutis:
            itemName = self.fruitArray[indexPath.row];
            break;
            default:
            break;
    }
    
    cell.textLabel.text = itemName;
    NSString *imageName = itemName;
    cell.imageView.image = [UIImage imageNamed:imageName];
    return cell;

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title;
    switch (section){
        case photos:
            title = @"Photos";
            break;
        case frutis:
            title = @"Fruits";
            break;
        default:
            break;
    }
    return title;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

@end

//
//  TableViewProvider.m
//  Obj-C 2-4-5
//
//  Created by Jack Wong on 2018/01/04.
//  Copyright © 2018 Jack. All rights reserved.
//

#import "TableViewProvider.h"
@import UIKit;
#import "CustomTableViewCell.h"

@implementation TableViewProvider

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:self.dataList[indexPath.row].imageUrl]];
    UIImage *imageReceived = [UIImage imageWithData:imageData];
    cell.dateLabel.text = self.dataList[indexPath.row].date;
    cell.telopLabel.text = self.dataList[indexPath.row].telop;
    cell.imgView.image = imageReceived;
    
    return cell;
}

@end

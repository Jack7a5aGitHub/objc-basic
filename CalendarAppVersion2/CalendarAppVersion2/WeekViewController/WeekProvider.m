//
//  WeekProvider.m
//  CalendarAppVersion2
//
//  Created by Jack Wong on 2018/01/10.
//  Copyright © 2018 Jack. All rights reserved.
//

#import "WeekProvider.h"

@implementation WeekProvider

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    WeekCell *weekCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"weekCell"
                                                                         forIndexPath:indexPath];
    NSArray *sevenDays = @[@"日",@"月",@"火",@"水",@"木",@"金",@"土"];
    
    weekCell.weekLabel.text = sevenDays[indexPath.row];
    
    switch (indexPath.row) {
        case 0:
            weekCell.weekLabel.textColor = [UIColor redColor];
            break;
        case 6:
            weekCell.weekLabel.textColor = [UIColor blueColor];
            break;
        default:
            weekCell.weekLabel.textColor = [UIColor blackColor];
            break;
    }
    return weekCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}
@end

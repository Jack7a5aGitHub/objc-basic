//
//  MonthProvider.m
//  CalendarAppVersion2
//
//  Created by Jack Wong on 2018/01/10.
//  Copyright © 2018 Jack. All rights reserved.
//

#import "MonthProvider.h"

@implementation MonthProvider

- ( UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
  
    MonthCell *monthCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"monthCell"
                                                                           forIndexPath:indexPath];
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"d";
    
    monthCell.monthLabel.text = [formatter stringFromDate:[self dateForCellAtIndexPath:indexPath]];
    
    monthCell.monthLabel.textColor = self.checkTheDate ? [UIColor blackColor] : [UIColor grayColor];
    if(self.checkTheDate){
        switch (self.weekDay) {
            case 1:
                monthCell.monthLabel.textColor =  [UIColor redColor];
                break;
            case 7:
                monthCell.monthLabel.textColor =  [UIColor blueColor];
                break;
            default:
                break;
        }
    }
    return monthCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.numberOfItems;
}

- (NSDate *)dateForCellAtIndexPath:(NSIndexPath *)indexPath
{
    self.theDate = [self.monthModel dateForCellAtIndexPath:indexPath.item];
    self.checkTheDate = [self.monthModel checkTheDateInMonth:self.theDate];
    self.weekDay =[self.monthModel checkWeekend:self.theDate];
    return self.theDate;
}

@end

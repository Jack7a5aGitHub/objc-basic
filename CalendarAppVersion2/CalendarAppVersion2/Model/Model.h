//
//  Model.h
//  CalendarAppVersion2
//
//  Created by Jack Wong on 2018/01/10.
//  Copyright © 2018 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
- (NSDate *)monthAgoDate;
- (NSDate *)monthLaterDate;
@end

@interface Model : NSObject

@property (nonatomic) NSDate * selectedDate;

-(NSInteger *)calculationNumberOfItems;
- (NSDate *)dateForCellAtIndexPath:(NSInteger )indexPathItem;
-(BOOL)checkTheDateInMonth:(NSDate*)date;
-(NSUInteger)checkWeekend:(NSDate*)date;

@end

static NSUInteger const DaysPerWeek = 7;

//
//  MonthProvider.h
//  CalendarAppVersion2
//
//  Created by Jack Wong on 2018/01/10.
//  Copyright © 2018 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "MonthCell.h"
#import "Model.h"

@interface MonthProvider : NSObject<UICollectionViewDataSource>

@property (nonatomic) Model *monthModel;
@property (nonatomic) NSDate *theDate;
@property (nonatomic) BOOL checkTheDate;
@property (nonatomic) NSInteger weekDay;
@property (nonatomic) NSInteger numberOfItems;

@end

//
//  TableViewProvider.h
//  Obj-C 2-4-5
//
//  Created by Jack Wong on 2018/01/04.
//  Copyright © 2018 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "Data.h"

@interface TableViewProvider : NSObject<UITableViewDataSource>

@property (strong,nonatomic) NSMutableArray<Data *> *dataList;

@end

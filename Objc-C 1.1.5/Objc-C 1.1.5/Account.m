//
//  Account.m
//  Objc-C 1.1.5
//
//  Created by Jack Wong on 2017/11/20.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "Account.h"
#import "FavouriteProgrammingLanguage.h"
@implementation Account

- (void) startAction{
    FavouriteProgrammingLanguage *try = [[FavouriteProgrammingLanguage alloc]init];
    try.delegate = self;
    [try printDetails];
}

//where delegated to the printDetails func
- (void)processCompleted{
    NSLog(@"Process Completed");
}

@end


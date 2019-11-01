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
    FavouriteProgrammingLanguage *objcCanDo = [[FavouriteProgrammingLanguage alloc]init];
    objcCanDo.delegate = self;
    [objcCanDo printDetails];
}

//where delegated to the printDetails

- (void)processCompleted{
    NSLog(@"Objective-Cができる!");
}

@end


//
//  main.m
//  Obj-C 1.1.4
//
//  Created by Jack Wong on 2017/11/18.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Account.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        Account *alex = [[Account alloc]initWithAge:18 andName:@"Alex" andSex:@"M" andnativeLanguage:@"Java"];
        Account *mary = [[Account alloc]initWithAge:99 andName:@"Mary" andSex:@"F" andnativeLanguage:@"Swift"];
        
        [alex printIntro];
        [mary printIntro];
        
    }
    return 0;
}




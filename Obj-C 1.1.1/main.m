//
//  main.m
//  Obj-C 1.1.1
//
//  Created by Jack Wong on 2017/11/15.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        BOOL flag = NO;
        NSInteger Int = 18;
        NSString *name = @"ABC";
        NSNumber *number = [NSNumber numberWithFloat:3.14];
        
        NSLog(flag ? @"YES": @"NO");
        NSLog(@"%@", name);
        NSLog(@"%ld", (long)Int);
        NSLog(@"%@", number);
        
        
    }
    return 0;
}

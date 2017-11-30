//
//  main.m
//  Obj-C 1.1.1
//
//  Created by Jack Wong on 2017/11/22.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        @autoreleasepool {
            
            BOOL flag = NO;
            NSInteger Int = 18;
            NSString *name = @"ABC";
            NSNumber *number = @3.14f;
            
            NSLog(flag ? @"YES": @"NO");
            NSLog(@"%@", name);
            NSLog(@"%ld", (long)Int);
            NSLog(@"%@", number);
            
        }
        return 0;
    
}
}

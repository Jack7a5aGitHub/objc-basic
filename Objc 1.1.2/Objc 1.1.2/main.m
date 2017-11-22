//
//  main.m
//  Objc 1.1.2
//
//  Created by Jack Wong on 2017/11/16.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSArray *colorList = @[@"Red",@"Blue",@"Yellow"];
        NSDictionary *dict = @{@"key1":@"1111",@"key2":@"number Two"};
        NSString *key;
        
        NSEnumerator *enu = [dict keyEnumerator];
        while (key = [enu nextObject]) {
            NSLog(@"%@: %@", key, dict[key]);
        }
        
         for (NSString *key in dict){
         NSLog(@"key: %@", key);
         NSLog(@"value: %@", [dict valueForKey:key]);
         }
         
        NSString *value = dict[@"key1"];
        NSLog(@"%@", value);
        NSLog(@"%@", colorList);
       // NSLog(@"%@", [enu allObjects]);
        
    }
    return 0;
}

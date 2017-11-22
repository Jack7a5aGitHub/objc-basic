//
//  main.m
//  Objc-C 1.1.5
//
//  Created by Jack Wong on 2017/11/20.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Account.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
   
        Account *tryPrint = [[Account alloc] init];
    
        [tryPrint startAction];
    }
    
    return 0;
}

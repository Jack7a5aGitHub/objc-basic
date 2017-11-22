//
//  main.m
//  Obj-C 1.1.3
//
//  Created by Jack Wong on 2017/11/18.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        int num = 16;
        // if ~else if 文
        if (num == 15) {
            printf("The number equals to 15");
        }else {
            printf("The number does not equal to 15");
        }
        // 三項演算子　The ternary operator
       (num == 15) ? printf("It is 15") : printf("It is not 15");
        //for 文
        NSArray *array = @[@"a", @"b", @"c", @"d"];
        NSString *item;
        for  (item in array) {
            NSLog(@"%@", array);
        }
        // Switch
        int a = 3;
        switch (a) {
            case 0:
            {
                printf("diamond");
            }
                break;
            case 3:
                printf("%d", a);
                break;
            default:
                break;
        
        }
        
    }
    return 0;
}

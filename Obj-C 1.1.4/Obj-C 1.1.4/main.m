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
        
        //[[Account alloc]init];
        Account *ss = [[Account alloc]initWithAge:18 andName:@"ss" andSex:@"M" andnativeLanguage:@"Java"];
        Account *FF = [[Account alloc]initWithAge:99 andName:@"FF" andSex:@"F" andnativeLanguage:@"NO"];
        /*
         Account *william = [Account personWithAge:18 andName:@"William" andSex:@"M" andNativeLanguage:@"English"];
         Account *mary = [Account personWithAge:20 andName:@"Mary" andSex:@"F" andNativeLanguage:@"Japanese"];
         */
        [ss printName];
        [ss printIntro];
        [FF printIntro];
        
    }
    return 0;
}




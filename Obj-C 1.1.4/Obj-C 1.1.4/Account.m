//
//  Account.m
//  Obj-C 1.1.4
//
//  Created by Jack Wong on 2017/11/18.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "Account.h"

@implementation Account

- (instancetype) initWithAge: (int)age andName:(NSString *)name andSex:(NSString *)sex andnativeLanguage:(NSString *)nativeLanguage{
    
    self = [super init];
    if (self) {
        self.age = age;
        self.name = name;
        self.sex = sex;
        self.nativeLanguage = nativeLanguage;
    }
    return self;
    
}

- (void) printName
{
    NSLog(@"%@", self.name);
}

- (void) printIntro
{
    if ([self.sex  isEqual: @"M"]) { NSLog(@"%@君は、%@が得意な%d歳です。", self.name, self.nativeLanguage, self.age);
    }else {
        NSLog(@"%@さんは、%@が得意な%d歳です。", self.name, self.nativeLanguage, self.age);
    }
}

/*
 + (instancetype) personWithAge:(int)age andName:(NSString *)name andSex:(NSString *)sex andNativeLanguage:(NSString *)nativeLanguage
 {
 Account *william = [[Account alloc] initWithAge:age andName:name andSex:sex  andnativeLanguage:nativeLanguage];
 return william;
 }
 */

@end



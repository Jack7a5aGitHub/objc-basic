//
//  Account.h
//  Obj-C 1.1.4
//
//  Created by Jack Wong on 2017/11/18.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property(nonatomic,retain) NSString *name;
@property(nonatomic,assign) int age;
@property(nonatomic,retain) NSString *sex;
@property(nonatomic,retain) NSString *nativeLanguage;

- (instancetype) initWithAge: (int)age andName:(NSString *)name andSex:(NSString *)sex andnativeLanguage:(NSString *)nativeLanguage;
- (void) printName;
- (void) printIntro;

/*
 + (instancetype) personWithAge:(int)age andName:(NSString *)name andSex:(NSString *)sex andNativeLanguage:(NSString *)nativeLanguage;
 */

@end

//
//  FavouriteProgrammingLanguage.h
//  Objc-C 1.1.5
//
//  Created by Jack Wong on 2017/11/20.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FavoriteProgrammingLanguageDelegate <NSObject>

- (void) processCompleted;

@end

@interface FavouriteProgrammingLanguage : NSObject
@property (nonatomic) id<FavoriteProgrammingLanguageDelegate> delegate;
- (void) printDetails;
//- (void) setDelegate:(id)newDelegate;

@end

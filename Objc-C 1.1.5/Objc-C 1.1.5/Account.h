//
//  Account.h
//  Objc-C 1.1.5
//
//  Created by Jack Wong on 2017/11/20.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavouriteProgrammingLanguage.h"

@interface Account : NSObject <FavoriteProgrammingLanguageDelegate>

- (void) startAction;

@end


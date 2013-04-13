//
//  RWCheckoutCart.h
//  RWPuppies
//
//  Created by Pietro Rea on 12/25/12.
//  Copyright (c) 2012 Pietro Rea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWPuppy.h"

@interface RWCheckoutCart : NSObject

+ (RWCheckoutCart *)sharedInstance;

- (NSArray*)puppiesInCart;

- (BOOL)containsPuppy:(RWPuppy*)puppy;

- (void)addPuppy:(RWPuppy*)puppy;

- (void)removePuppy:(RWPuppy*)puppy;

- (void)clearCart;

- (NSNumber*)total; 

@end

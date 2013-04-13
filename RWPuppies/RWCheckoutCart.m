//
//  RWCheckoutCart.m
//  RWPuppies
//
//  Created by Pietro Rea on 12/25/12.
//  Copyright (c) 2012 Pietro Rea. All rights reserved.
//

#import "RWCheckoutCart.h"

@interface RWCheckoutCart()

@property (strong, nonatomic) NSMutableArray* puppiesArray;

@end

@implementation RWCheckoutCart

- (id)init {
    self = [super init];
    if (self) {
        //Custom initialization
        self.puppiesArray = [[NSMutableArray alloc] init];
    }
    return self;
}


+ (RWCheckoutCart *)sharedInstance {
    static RWCheckoutCart*  _sharedCart;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedCart = [[RWCheckoutCart alloc] init];
    });
    
    return _sharedCart;
}

- (NSArray*)puppiesInCart {
    return self.puppiesArray;
}

- (BOOL)containsPuppy:(RWPuppy*)puppy {
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"ID=%@", puppy.ID];
    NSArray* duplicatePuppies = [self.puppiesArray filteredArrayUsingPredicate:predicate];
    return (duplicatePuppies.count > 0) ? YES : NO;
}

- (void)addPuppy:(RWPuppy*)puppy {
    if (![self containsPuppy:puppy]) {
        [self.puppiesArray addObject:puppy];
    }
}

- (void)removePuppy:(RWPuppy*)puppy {
    [self.puppiesArray removeObject:puppy];
}

- (void)clearCart {
    self.puppiesArray = [[NSMutableArray alloc] init];
}

- (NSNumber*)total {
    
    double total = 0.0;
    for (RWPuppy* puppy in self.puppiesInCart) {
        total += [puppy.price doubleValue];
    }
    return @(total);
}

@end

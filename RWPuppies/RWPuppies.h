//
//  RWPuppies.h
//  RWPuppies
//
//  Created by Christopher LaPollo on 2/18/13.
//  Copyright (c) 2013 Pietro Rea. All rights reserved.
//

#import <Foundation/Foundation.h>


// This class just provides a central location for storing the available puppies
@interface RWPuppies : NSObject

@property (strong, readonly, nonatomic) NSArray *allPuppies;

+ (RWPuppies *)sharedInstance;

@end

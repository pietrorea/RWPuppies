//
//  RWPuppy.h
//  RWPuppies
//
//  Created by Pietro Rea on 12/18/12.
//  Copyright (c) 2012 Pietro Rea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWPuppy : NSObject

@property (strong, nonatomic) NSNumber* ID;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* breedName;
@property (strong, nonatomic) NSString* photoURL;

@property (strong, nonatomic) NSNumber* price;        //$$
@property (strong, nonatomic) NSNumber* maxWeight;    //lbs
@property (strong, nonatomic) NSNumber* maxHeight;    //in
@property (strong, nonatomic) NSNumber* cuddleFactor; //out of 5

@end

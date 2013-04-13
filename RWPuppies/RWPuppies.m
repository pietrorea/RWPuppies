//
//  RWPuppies.m
//  RWPuppies
//
//  Created by Christopher LaPollo on 2/18/13.
//  Copyright (c) 2013 Pietro Rea. All rights reserved.
//

#import "RWPuppies.h"
#import "RWPuppy.h"


@implementation RWPuppies

+ (RWPuppies *)sharedInstance {
  static RWPuppies*  _sharedPuppies;
  
  static dispatch_once_t once;
  dispatch_once(&once, ^{
    _sharedPuppies = [[RWPuppies alloc] init];
  });
  
  return _sharedPuppies;
}

- (id)init
{
  if((self = [super init]))
  {
    _allPuppies = [self loadPuppiesFromJSON];
  }
  return self;
}

- (NSArray *)loadPuppiesFromJSON {
  
  NSString* filePath = [[NSBundle mainBundle] pathForResource:@"dogs" ofType:@"json"];
  
  NSError* error;
  NSData* jsonData =  [NSData dataWithContentsOfFile:filePath options:NSDataReadingUncached error:&error];
  NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
  
  NSMutableArray* puppyArray = [[NSMutableArray alloc] initWithCapacity:jsonArray.count];
  
  for (NSDictionary* puppyDictionary in jsonArray) {
    RWPuppy* puppy = [[RWPuppy alloc] init];
    puppy.ID = puppyDictionary[@"id"];
    puppy.name = puppyDictionary[@"name"];
    puppy.breedName = puppyDictionary[@"breed"];
    puppy.photoURL = puppyDictionary[@"photo-large"];
    puppy.maxHeight = puppyDictionary[@"max_weight"];
    puppy.maxWeight = puppyDictionary[@"max_height"];
    puppy.cuddleFactor = puppyDictionary[@"cuddle_factor"];
    puppy.price = puppyDictionary[@"price"];
    [puppyArray addObject:puppy];
  }
  
  return puppyArray;
}

@end

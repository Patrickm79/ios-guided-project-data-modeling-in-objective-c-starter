//
//  PDMQuake.m
//  Quakes-Objc
//
//  Created by Patrick Millet on 6/10/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "PDMQuake.h"

@implementation PDMQuake

- (instancetype)initWithMagnitude:(double)magnitude
                            place:(NSString *)place
                             time:(NSDate *)time
                         latitude:(double)latitude
                        longitude:(double)longitude;
{
    self = [super init];
    if (self) {
        // Comments in implementation details in the method, don't write a header comment here.
        _magnitude = magnitude;
        //NSString -> NSMutableString
        //Always use copy to turn a mutable NSMutableString into a immutable NSString
        _place = [place copy];
        _time = time;
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}

// Use this method with NSJSONSerizliatation

// This is a convenience initalizer and call the previous init
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
{
    // Pull out data from dictionary
    
    // If valid, create object and return it
    
    // If invalid, return nil (failure)
    
    
    return nil;
}

@end

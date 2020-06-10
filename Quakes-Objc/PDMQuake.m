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
    NSDictionary *properties = dictionary[@"properties"]; // FIXME: Use constants for properties / attributes to prevent stringly typed errors
    NSDictionary *geometry = dictionary[@"geometry"];
    NSArray *coordinates = geometry[@"coordinates"];
    // If valid, create object and return it
    // If invalid, return nil (failure)
    // Create temporary values
    
    NSNumber *magnitudeNumber = properties[@"mag"];
    NSString *place = properties[@"place"];
    NSNumber *timeNumber = properties[@"time"];
    NSNumber *latitude = nil;
    NSNumber *longitude = nil;
    
    if (coordinates.count >= 2) { // Prevents index out of bounds crash
        // Longitude is first in array based on API
        latitude = coordinates[1];
        longitude = coordinates[0];
    } else {
        NSLog(@"Missing coordinates"); // TODO: some UI response??
    }
    
    // Required properties for valid object (not always a safe option and depends on data)
    if (magnitudeNumber && place && timeNumber && latitude && longitude) {
        
        NSDate *time = [[NSDate alloc] initWithTimeIntervalSince1970:timeNumber.longValue / 1000.0];
        
        self = [self initWithMagnitude:magnitudeNumber.doubleValue place:place time:time latitude:latitude.doubleValue longitude:longitude.doubleValue];
        return self;
    } else { // Missing a property we consider essential, throw out the data.
    return nil;
    }
}

@end

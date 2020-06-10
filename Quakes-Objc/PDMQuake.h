//
//  PDMQuake.h
//  Quakes-Objc
//
//  Created by Patrick Millet on 6/10/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PDMQuake : NSObject

// More property attributes
// assign(default), copy

@property (nonatomic) double magnitude;
@property (nonatomic, copy) NSString *place;
@property (nonatomic) NSDate *time;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;


// We can't use the JSONEncoder / JSONDecoder in Objc or in a mix of Swift/Objc

// Use NSJSONSerialization for Objc or mix language models

// When writing in any language that has 2 files per class, always write your comments in your header file
- (instancetype)initWithMagnitude:(double)magnitude
                            place:(NSString *)place
                             time:(NSDate *)time
                         latitude:(double)latitude
                        longitude:(double)longitude;

// Use this method with NSJSONSerizliatation
/// Sets up object with dictionary from JSON
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

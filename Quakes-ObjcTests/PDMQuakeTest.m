//
//  PDMQuakeTest.m
//  Quakes-ObjcTests
//
//  Created by Patrick Millet on 6/10/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PDMQuake.h"
#import "LSIFileHelper.h"
#import "LSILog.h"

@interface PDMQuakeTest : XCTestCase

@end

@implementation PDMQuakeTest

- (void)testQuakeParses {
    NSData *quakeData = loadFile(@"Quake.json", [PDMQuakeTest class]);
    NSLog(@"Quake Data: %@", quakeData);
    
    NSError *error = nil; // nil means no error
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:quakeData options:0 error:&error]; // & = address of operator
    
    if (error) { // (error != nil)
        XCTFail(@"Error decoding JSON: %@", error);
    }
    
    NSLog(@"Decoded Dictionary: %@", json);
    
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:1388620296020 / 1000.0];
    PDMQuake *quake = [[PDMQuake alloc] initWithDictionary:json];
    
    NSLog(@"quake: %@", quake);
    XCTAssertEqualWithAccuracy(1.29, quake.magnitude, 0.0001);
    XCTAssertEqualObjects(@"10km SSW of Idyllwild, CA", quake.place);
    XCTAssertEqualObjects(time, quake.time);
    XCTAssertEqualWithAccuracy(33.663333299999998, quake.latitude, 0.0001);
    XCTAssertEqualWithAccuracy(-116.7776667, quake.longitude, 0.0001);
}

@end

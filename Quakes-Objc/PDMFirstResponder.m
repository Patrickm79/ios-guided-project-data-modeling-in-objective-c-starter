//
//  PDMFirstResponder.m
//  Quakes-Objc
//
//  Created by Patrick Millet on 6/10/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "PDMFirstResponder.h"

@interface PDMFirstResponder () {
    // Declare instance variables (not properties)
//    NSString *_firstName;
}
@end


@implementation PDMFirstResponder

// Placment 1: Synthesize statments

// override the default Getter

// Placment 2: Synthesize statments
// this is asking the compiler to generate an instance variable using the format _propertyName
@synthesize firstName = _firstName;

- (NSString *)firstName {
    return _firstName;
}

- (void)setFirstName:(NSString *)firstName {
    
}

@end

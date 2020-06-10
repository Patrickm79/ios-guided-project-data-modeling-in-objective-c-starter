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
    NSString *_firstName;
}

@end


@implementation PDMFirstResponder

- (NSString *)firstName {
    return _firstName;
}

- (void)setFirstName:(NSString *)firstName {
    
}

@end

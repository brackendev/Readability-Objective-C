//
//  Readability+NSNumber.m
//  Readability-Objective-C
//
//  Created by Bracken Spencer.
//  Copyright (c) 2014-2021 Bracken Spencer. All rights reserved.
//

#import "Readability+NSNumber.h"

@implementation NSNumber (Readability)

- (NSDecimalNumber *)roundToPlaces:(NSInteger)places {
    NSDecimalNumber *decimalNumber = [[NSDecimalNumber alloc] initWithFloat:self.floatValue];
    NSDecimalNumberHandler *decimalNumberHandler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                                          scale:places
                                                                                               raiseOnExactness:NO
                                                                                                raiseOnOverflow:NO
                                                                                               raiseOnUnderflow:NO
                                                                                            raiseOnDivideByZero:NO];
    
    return [decimalNumber decimalNumberByRoundingAccordingToBehavior:decimalNumberHandler];
}

@end

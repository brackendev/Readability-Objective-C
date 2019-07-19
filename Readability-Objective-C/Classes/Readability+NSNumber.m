//
//  Readability+NSNumber.m
//  Readability-Objective-C
//
//  Created by brackendev.
//  Copyright (c) 2014-2019 brackendev. All rights reserved.
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

#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SyllableCounter.h"
#import "Readability+NSNumber.h"
#import "Readability+NSString.h"
#import "Readability.h"

FOUNDATION_EXPORT double Readability_Objective_CVersionNumber;
FOUNDATION_EXPORT const unsigned char Readability_Objective_CVersionString[];


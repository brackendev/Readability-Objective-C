//
//  Readability.h
//  Readability-Objective-C
//
//  Created by brackendev.
//  Copyright (c) 2014-2019 brackendev. All rights reserved.
//

//  Automated Readability Index: automatedReadabilityIndexForString
//           Coleman–Liau Index: colemanLiauIndexForString
//   Flesch-Kincaid Grade Level: fleschKincaidGradeLevelForString
//          Flesch Reading Ease: fleschReadingEaseForString
//            Gunning Fog Index: gunningFogScoreForString
//                   SMOG Grade: smogGradeForString

@import Foundation;

@interface Readability : NSObject

+ (NSDictionary *)automatedReadabilityIndexForString:(NSString *)string;
+ (NSDecimalNumber *)colemanLiauIndexForString:(NSString *)string;
+ (NSDecimalNumber *)fleschKincaidGradeLevelForString:(NSString *)string;
+ (NSDictionary *)fleschReadingEaseForString:(NSString *)string;
+ (NSDecimalNumber *)gunningFogScoreForString:(NSString *)string;
+ (NSDecimalNumber *)smogGradeForString:(NSString *)string;

@end

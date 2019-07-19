//
//  Readability+NSString.m
//  Readability-Objective-C
//
//  Created by brackendev.
//  Copyright (c) 2014-2019 brackendev. All rights reserved.
//

#import "Readability+NSString.h"
#import "SyllableCounter.h"

@implementation NSString (Readability)

- (BOOL)isPolysyllableWithExcludingCommonSuffixes:(BOOL)excludeCommonSuffixes {
    __block BOOL polysyllable = NO;

    if ([SyllableCounter syllableCountForWord:self] > 2) {
        if (excludeCommonSuffixes) {
            if (![self.lowercaseString hasSuffix:@"es"] &&
                    ![self.lowercaseString hasSuffix:@"ed"] &&
                    ![self.lowercaseString hasSuffix:@"ing"]) {
                polysyllable = YES;
            }
        } else {
            polysyllable = YES;
        }
    }

    return polysyllable;
}

- (NSUInteger)polysyllableWordsWithExcludingCommonSuffixes:(BOOL)excludeCommonSuffixes {
    __block NSUInteger count = 0;

    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByWords
                          usingBlock:^(NSString *word, NSRange wordRange, NSRange enclosingRange, BOOL *stop) {
                              if ([word isPolysyllableWithExcludingCommonSuffixes:excludeCommonSuffixes]) {
                                  count++;
                              }
                          }];

    return count;
}

- (NSUInteger)complexWordCount {
    __block NSUInteger count = 0;

    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByWords
                          usingBlock:^(NSString *word, NSRange wordRange, NSRange enclosingRange, BOOL *stop) {
                              // Attemping the complex word suggestions at http://en.wikipedia.org/wiki/Gunning_fog_index
                              BOOL polysyllable = [word isPolysyllableWithExcludingCommonSuffixes:YES];
                              BOOL properNoun = [word isCapitalized];
                              BOOL familiarJargon = NO; // TODO: Implement
                              BOOL compound = NO; // TODO: Implement

                              if (polysyllable && !properNoun && !familiarJargon && !compound) {
                                  count++;
                              }
                          }];

    return count;
}

- (BOOL)isCapitalized {
    unichar character = [self characterAtIndex:0];
    BOOL capitalized = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:character];

    return capitalized;
}

- (BOOL)isAlphanumeric {
    if ([self alphanumeric].length > 0) {
        return YES;
    }

    return NO;
}

- (NSString *)alphanumeric {
    NSCharacterSet *charactersToRemove = [NSCharacterSet alphanumericCharacterSet].invertedSet;
    NSArray<NSString *> *componentsSeparated = [self componentsSeparatedByCharactersInSet:charactersToRemove];
    NSString *componentsJoined = [componentsSeparated componentsJoinedByString:@" "];

    return [componentsJoined condense];
}

- (NSUInteger)alphanumericCount {
    NSCharacterSet *charactersToRemove = [NSCharacterSet alphanumericCharacterSet].invertedSet;
    NSArray<NSString *> *componentsSeparated = [self componentsSeparatedByCharactersInSet:charactersToRemove];
    NSUInteger count = 0;

    for (NSString *word in componentsSeparated) {
        if (word.length > 0) {
            count += word.length;
        }
    }

    return count;
}

- (NSString *)condense {
    NSString *squashed = [self stringByReplacingOccurrencesOfString:@"[ ]+"
                                                         withString:@" "
                                                            options:NSRegularExpressionSearch
                                                              range:NSMakeRange(0, self.length)];

    return [squashed stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSUInteger)count:(NSStringEnumerationOptions)option {
    __block NSUInteger count = 0;

    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:option
                          usingBlock:^(NSString *word, NSRange wordRange, NSRange enclosingRange, BOOL *stop) {
                              count++;
                          }];

    return count;
}

- (NSUInteger)sentenceCount {
    return [self count:NSStringEnumerationBySentences];
}

- (NSUInteger)wordCount {
    return [self count:NSStringEnumerationByWords];
}

@end

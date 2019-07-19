//
//  Readability+NSString.h
//  Readability-Objective-C
//
//  Created by brackendev.
//  Copyright (c) 2014-2019 brackendev. All rights reserved.
//

@import Foundation;

@interface NSString (Readability)

- (BOOL)isPolysyllableWithExcludingCommonSuffixes:(BOOL)excludeCommonSuffixes;
- (NSUInteger)polysyllableWordsWithExcludingCommonSuffixes:(BOOL)excludeCommonSuffixes;
- (NSUInteger)complexWordCount;
- (BOOL)isCapitalized;
- (BOOL)isAlphanumeric;
- (NSString *)alphanumeric;
- (NSUInteger)alphanumericCount;
- (NSString *)condense;
- (NSUInteger)sentenceCount;
- (NSUInteger)wordCount;

@end

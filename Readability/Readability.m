//
//  Readability.m
//  Readability-Objective-C
//
//  Created by brackendev.
//  Copyright (c) 2014-2019 brackendev. All rights reserved.
//

@import CoreGraphics;

#import "Readability.h"
#import "Readability+NSNumber.h"
#import "Readability+NSString.h"
#import "SyllableCounter.h"

@implementation Readability

#pragma mark - Automated Readability Index
// http://en.wikipedia.org/wiki/Automated_Readability_Index

+ (NSDictionary *)automatedReadabilityIndexForString:(NSString *)string {
    NSDecimalNumber *score = [self automatedReadabilityIndexScoreForString:string];
    NSDictionary *dict = @{@"Score": score,
                           @"Ages": [self automatedReadabilityIndexAgesForScore:score.floatValue],
                           @"USA School Level": [self automatedReadabilityIndexUSASchoolLevelForScore:score.floatValue]};

    return dict;
}

+ (NSDecimalNumber *)automatedReadabilityIndexScoreForString:(NSString *)string {
    CGFloat totalWords = (CGFloat)[string wordCount];
    CGFloat totalSentences = (CGFloat)[string sentenceCount];
    CGFloat totalAlphanumericCharacters = (CGFloat)[string alphanumericCount];
    CGFloat score = 4.71f * (totalAlphanumericCharacters / totalWords) + 0.5f * (totalWords / totalSentences) - 21.43f;

    return [[NSNumber numberWithFloat:score] roundToPlaces:1];
}

+ (NSString *)automatedReadabilityIndexAgesForScore:(CGFloat)score {
    if (score >= 15) {
        return @"23+";
    } else if (score >= 14) {
        return @"18-22";
    } else if (score >= 13) {
        return @"17-18";
    } else if (score >= 12) {
        return @"16-17";
    } else if (score >= 11) {
        return @"15-16";
    } else if (score >= 10) {
        return @"14-15";
    } else if (score >= 9) {
        return @"13-14";
    } else if (score >= 8) {
        return @"12-13";
    } else if (score >= 7) {
        return @"11-12";
    } else if (score >= 6) {
        return @"10-11";
    } else if (score >= 5) {
        return @"9-10";
    } else if (score >= 4) {
        return @"8-9";
    } else if (score >= 3) {
        return @"7-8";
    } else if (score >= 2) {
        return @"6-7";
    } else {
        return @"5-6";
    }
}

+ (NSString *)automatedReadabilityIndexUSASchoolLevelForScore:(CGFloat)score {
    if (score >= 14) {
        return @"College";
    } else if (score >= 13) {
        return @"12";
    } else if (score >= 12) {
        return @"11";
    } else if (score >= 11) {
        return @"10";
    } else if (score >= 10) {
        return @"9";
    } else if (score >= 9) {
        return @"8";
    } else if (score >= 8) {
        return @"7";
    } else if (score >= 7) {
        return @"6";
    } else if (score >= 6) {
        return @"5";
    } else if (score >= 5) {
        return @"4";
    } else if (score >= 4) {
        return @"3";
    } else if (score >= 3) {
        return @"2";
    } else if (score >= 2) {
        return @"1";
    } else {
        return @"Kindergarten";
    }
}

#pragma mark - Coleman-Liau Index
// http://en.wikipedia.org/wiki/Coleman–Liau_index

+ (NSDecimalNumber *)colemanLiauIndexForString:(NSString *)string {
    CGFloat totalWords = [string wordCount];
    CGFloat totalSentences = [string sentenceCount];
    CGFloat totalAlphanumericCharacters = [string alphanumericCount];
    CGFloat score = 5.88f * (totalAlphanumericCharacters / totalWords) - 0.296f * (totalSentences / totalWords) - 15.8f;

    return [[NSNumber numberWithFloat:score] roundToPlaces:1];
}

#pragma mark - Flesch-Kincaid Grade Level
// http://en.wikipedia.org/wiki/Flesch–Kincaid_readability_tests

+ (NSDecimalNumber *)fleschKincaidGradeLevelForString:(NSString *)string {
    CGFloat totalWords = [string wordCount];
    CGFloat totalSentences = [string sentenceCount];
    NSString *alphaNumeric = [string alphanumeric];
    CGFloat totalSyllables = [SyllableCounter syllableCountForWords:alphaNumeric];
    CGFloat score = 0.39f * (totalWords / totalSentences) + 11.8f * (totalSyllables / totalWords) - 15.59f;

    return [[NSNumber numberWithFloat:score] roundToPlaces:1];
}

#pragma mark - Flesch Reading Ease
// http://en.wikipedia.org/wiki/Flesch–Kincaid_readability_tests

+ (NSDictionary *)fleschReadingEaseForString:(NSString *)string {
    NSDecimalNumber *score = [self fleschReadingEaseScoreForString:string];
    NSDictionary *dict = @{@"Score": score,
                           @"USA School Level": [self fleschReadingEaseUSASchoolLevelForScore:score.floatValue],
                           @"Notes": [self fleschReadingEaseNotesForScore:score.floatValue]};

    return dict;
}

+ (NSDecimalNumber *)fleschReadingEaseScoreForString:(NSString *)string {
    CGFloat totalWords = [string wordCount];
    CGFloat totalSentences = [string sentenceCount];
    NSString *alphaNumeric = [string alphanumeric];
    CGFloat totalSyllables = [SyllableCounter syllableCountForWords:alphaNumeric];
    CGFloat score = 206.835f - (1.015f * (totalWords / totalSentences)) - (84.6f * (totalSyllables / totalWords));

    return [[NSNumber numberWithFloat:score] roundToPlaces:1];
}

+ (NSString *)fleschReadingEaseUSASchoolLevelForScore:(CGFloat)score {
    if (score >= 90) {
        return @"5";
    } else if (score >= 80) {
        return @"6";
    } else if (score >= 70) {
        return @"7";
    } else if (score >= 60) {
        return @"8-9";
    } else if (score >= 50) {
        return @"10-12";
    } else if (score >= 30) {
        return @"College";
    } else {
        return @"College Graduate";
    }
}

+ (NSString *)fleschReadingEaseNotesForScore:(CGFloat)score {
    if (score >= 90) {
        return @"Very easy to read. Easily understood by an average 11-year-old student.";
    } else if (score >= 80) {
        return @"Easy to read. Conversational English for consumers.";
    } else if (score >= 70) {
        return @"Fairly easy to read.";
    } else if (score >= 60) {
        return @"Plain English. Easily understood by 13- to 15-year-old students.";
    } else if (score >= 50) {
        return @"Fairly difficult to read.";
    } else if (score >= 30) {
        return @"Difficult to read.";
    } else {
        return @"Very difficult to read. Best understood by university graduates.";
    }
}

#pragma mark - Gunning Fog Score
// http://en.wikipedia.org/wiki/Gunning_fog_index

+ (NSDecimalNumber *)gunningFogScoreForString:(NSString *)string {
    CGFloat totalWords = [string wordCount];
    CGFloat totalSentences = [string sentenceCount];
    CGFloat totalComplexWords = [string complexWordCount];
    CGFloat score = 0.4f * ((totalWords / totalSentences) + 100.0f * (totalComplexWords / totalWords));

    return [[NSNumber numberWithFloat:score] roundToPlaces:1];
}

#pragma mark - SMOG Grade
// http://en.wikipedia.org/wiki/Gunning_fog_index

+ (NSDecimalNumber *)smogGradeForString:(NSString *)string {
    CGFloat totalSentences = [string sentenceCount];
    CGFloat totalPolysyllables = [string polysyllableWordsWithExcludingCommonSuffixes:NO];
    CGFloat score = 1.043f * sqrtf(totalPolysyllables * (30.0f / totalSentences) + 3.1291f);

    return [[NSNumber numberWithFloat:score] roundToPlaces:1];
}

@end

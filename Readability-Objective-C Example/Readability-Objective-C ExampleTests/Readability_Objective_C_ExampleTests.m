//
//  Readability_Objective_C_ExampleTests.m
//  Readability-Objective-C Example
//
//  Created by brackendev.
//  Copyright (c) 2014-2019 brackendev. All rights reserved.
//

@import CoreGraphics;
@import XCTest;

#import "Readability.h"
#import "Readability+NSNumber.h"
#import "Readability+NSString.h"
#import "SyllableCounter.h"

@interface Readability (Test)

- (NSDecimalNumber *)roundFloat:(CGFloat)aFloat places:(NSInteger)places;
- (NSUInteger)wordsInString:(NSString *)string;
- (NSUInteger)sentencesInString:(NSString *)string;
- (NSUInteger)alphanumericCharactersInString:(NSString *)string;
- (NSString *)alphanumericString:(NSString *)string;
- (NSString *)cleanupWhiteSpace:(NSString *)string;
- (BOOL)isWordPolysyllable:(NSString *)word excludeCommonSuffixes:(BOOL)excludeCommonSuffixes;
- (NSUInteger)polysyllableWordsInString:(NSString *)string excludeCommonSuffixes:(BOOL)excludeCommonSuffixes;
- (BOOL)isWordCapitalized:(NSString *)word;
- (NSUInteger)complexWordsInString:(NSString *)string;

@end

@interface Readability_Objective_C_ExampleTests : XCTestCase

@property (nonatomic, strong) NSString *testString1;
@property (nonatomic, strong) NSString *testString2;

@end

@implementation Readability_Objective_C_ExampleTests

- (void)setUp {
    [super setUp];

    //                              read-able.com   readability-score.com   Readability-Objective-C
    // Automated Readability Index: 9.7             9.7                     9.7
    //          Coleman–Liau Index: 15.0            15.0                    14.9
    //         Flesch Reading Ease: 24.4            30.9                    24.4
    //  Flesch–Kincaid Grade Level: 13.1            12.2                    13.1
    //           Gunning Fog Score: 14.4            11.4                    14.4
    //                  SMOG Grade: 11.6            10.1                    11.6
    self.testString1 = @"The Australian platypus is seemingly a hybrid of a mammal and reptilian creature.";

    //                              read-able.com   readability-score.com   Readability-Objective-C
    // Automated Readability Index: 12.1            12.1                    12.1
    //          Coleman–Liau Index: 9.2             9.2                     9.1
    //         Flesch Reading Ease: 65.4            65.4                    64.8
    //  Flesch–Kincaid Grade Level: 10.9            10.9                    11.0
    //           Gunning Fog Score: 13.8            13.8                    12.6
    //                  SMOG Grade: 8.3             8.3                     8.3
    self.testString2 = @"Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal. Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this. But, in a larger sense, we can not dedicate, we can not consecrate, we can not hallow this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth.";
}

#pragma mark - Readability_iOS

- (void)testReadabilityString1 {
    NSDecimalNumber *automatedReadabilityIndex = [Readability automatedReadabilityIndexForString:self.testString1][@"Score"];
    NSDecimalNumber *fleschReadingEase = [Readability fleschReadingEaseForString:self.testString1][@"Score"];

    XCTAssert(automatedReadabilityIndex.doubleValue == 9.7);
    XCTAssert([Readability colemanLiauIndexForString:self.testString1].doubleValue == 14.9);
    XCTAssert([Readability fleschKincaidGradeLevelForString:self.testString1].doubleValue == 13.1);
    XCTAssert(fleschReadingEase.doubleValue == 24.4);
    XCTAssert([Readability gunningFogScoreForString:self.testString1].doubleValue == 14.4);
    XCTAssert([Readability smogGradeForString:self.testString1].doubleValue == 11.6);
}

- (void)testReadabilityString2 {
    NSDecimalNumber *automatedReadabilityIndexScore = [Readability automatedReadabilityIndexForString:self.testString2][@"Score"];
    NSString *automatedReadabilityIndexAges = [Readability automatedReadabilityIndexForString:self.testString2][@"Ages"];
    NSString *automatedReadabilityIndexUSASchoolLevel = [Readability automatedReadabilityIndexForString:self.testString2][@"USA School Level"];
    NSDecimalNumber *fleschReadingEaseScore = [Readability fleschReadingEaseForString:self.testString2][@"Score"];
    NSString *fleschReadingEaseUSASchoolLevel = [Readability fleschReadingEaseForString:self.testString2][@"USA School Level"];
    NSString *fleschReadingEaseNotes = [Readability fleschReadingEaseForString:self.testString2][@"Notes"];

    XCTAssert(automatedReadabilityIndexScore.doubleValue == 12.1);
    XCTAssert([automatedReadabilityIndexAges isEqualToString:@"16-17"]);
    XCTAssert([automatedReadabilityIndexUSASchoolLevel isEqualToString:@"11"]);
    XCTAssert([Readability colemanLiauIndexForString:self.testString2].doubleValue == 9.1);
    XCTAssert([Readability fleschKincaidGradeLevelForString:self.testString2].doubleValue == 11.0);
    XCTAssert(fleschReadingEaseScore.doubleValue == 64.8);
    XCTAssert([fleschReadingEaseUSASchoolLevel isEqualToString:@"8-9"]);
    XCTAssert([fleschReadingEaseNotes isEqualToString:@"Plain English. Easily understood by 13- to 15-year-old students."]);
    XCTAssert([Readability gunningFogScoreForString:self.testString2].doubleValue == 12.6);
    XCTAssert([Readability smogGradeForString:self.testString2].doubleValue == 8.3);
}

- (void)testRoundFloat {
    XCTAssert([[NSNumber numberWithFloat:9.7069229712853051f] roundToPlaces:1].floatValue == 9.7f);
    XCTAssert([[NSNumber numberWithFloat:13.079999923706055f] roundToPlaces:2].floatValue == 13.08f);
    XCTAssert([[NSNumber numberWithFloat:24.440014648437511f] roundToPlaces:3].floatValue == 24.440f);
    XCTAssert([[NSNumber numberWithFloat:14.430769445804451f] roundToPlaces:4].floatValue == 14.4308f);
    XCTAssert([[NSNumber numberWithFloat:11.573498725891113f] roundToPlaces:5].floatValue == 11.5735f);
}

- (void)testWordCount {
    XCTAssertEqual([self.testString1 wordCount], 13);
    XCTAssertEqual([self.testString2 wordCount], 271);
}

- (void)testSentenceCount {
    XCTAssertEqual([self.testString1 sentenceCount], 1);
    XCTAssertEqual([self.testString2 sentenceCount], 10);
}

- (void)testAlphanumericCount {
    XCTAssertEqual([self.testString1 alphanumericCount], 68);
    XCTAssertEqual([self.testString2 alphanumericCount], 1149);
}

- (void)testAlphanumeric {
    XCTAssertEqual([self.testString1 alphanumeric].length, @"The Australian platypus is seemingly a hybrid of a mammal and reptilian creature".length);
    XCTAssertEqual([self.testString2 alphanumeric].length, @"Four score and seven years ago our fathers brought forth on this continent a new nation conceived in liberty and dedicated to the proposition that all men are created equal Now we are engaged in a great civil war testing whether that nation or any nation so conceived and so dedicated can long endure We are met on a great battlefield of that war We have come to dedicate a portion of that field as a final resting place for those who here gave their lives that that nation might live It is altogether fitting and proper that we should do this But in a larger sense we can not dedicate we can not consecrate we can not hallow this ground The brave men living and dead who struggled here have consecrated it far above our poor power to add or detract The world will little note nor long remember what we say here but it can never forget what they did here It is for us the living rather to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced It is rather for us to be here dedicated to the great task remaining before us that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion that we here highly resolve that these dead shall not have died in vain that this nation under God shall have a new birth of freedom and that government of the people by the people for the people shall not perish from the earth".length);
}

- (void)testCondense {
    XCTAssertEqual([@"   Test      test        test test          " condense].length, @"Test test test test".length);
}

- (void)testIsPolysyllableWithExcludingCommonSuffixes {
    XCTAssert([@"crowdsourcing" isPolysyllableWithExcludingCommonSuffixes:NO] == YES);
    XCTAssert([@"crowdsourcing" isPolysyllableWithExcludingCommonSuffixes:YES] == NO);
}

- (void)testPolysyllableWordsWithExcludingCommonSuffixes {
    XCTAssertEqual([self.testString1 polysyllableWordsWithExcludingCommonSuffixes:NO], 4);
    XCTAssertEqual([self.testString1 polysyllableWordsWithExcludingCommonSuffixes:YES], 4);

    XCTAssertEqual([self.testString2 polysyllableWordsWithExcludingCommonSuffixes:NO], 20);
    XCTAssertEqual([self.testString2 polysyllableWordsWithExcludingCommonSuffixes:YES], 12);
}

- (void)testIsCapitalized {
    XCTAssert([@"Test" isCapitalized] == YES);
    XCTAssert([@"Test " isCapitalized] == YES);
    XCTAssert([@"TEST" isCapitalized] == YES);
    XCTAssert([@"A " isCapitalized] == YES);
    XCTAssert([@"test" isCapitalized] == NO);
    XCTAssert([@"tEst" isCapitalized] == NO);
    XCTAssert([@" Test" isCapitalized] == NO);
}

- (void)testComplexWordCount {
    XCTAssertEqual([self.testString1 complexWordCount], 3);
    XCTAssertEqual([self.testString2 complexWordCount], 12);
}

#pragma mark - SyllableCounter

- (void)testSyllableCountForWord {
    XCTAssertEqual([SyllableCounter syllableCountForWord:@"The"], 1);
    XCTAssertEqual([SyllableCounter syllableCountForWord:@"Australian"], 4);
    XCTAssertEqual([SyllableCounter syllableCountForWord:@"platypus"], 3);
    XCTAssertEqual([SyllableCounter syllableCountForWord:@"is"], 1);
    XCTAssertEqual([SyllableCounter syllableCountForWord:@"seemingly"], 3);
    XCTAssertEqual([SyllableCounter syllableCountForWord:@"a"], 1);
    XCTAssertEqual([SyllableCounter syllableCountForWord:@"hybrid"], 2);
    XCTAssertEqual([SyllableCounter syllableCountForWord:@"of"], 1);
    XCTAssertEqual([SyllableCounter syllableCountForWord:@"mammal"], 2);
    XCTAssertEqual([SyllableCounter syllableCountForWord:@"and"], 1);
    XCTAssertEqual([SyllableCounter syllableCountForWord:@"reptilian"], 4);
    XCTAssertEqual([SyllableCounter syllableCountForWord:@"creature."], 2);
}

- (void)testSyllableCountForWords {
    NSString *cleaned1 = [self.testString1 alphanumeric];
    NSString *cleaned2 = [self.testString2 alphanumeric];

    XCTAssertEqual([SyllableCounter syllableCountForWords:cleaned1], 26);
    XCTAssertEqual([SyllableCounter syllableCountForWords:cleaned2], 367);
}

@end

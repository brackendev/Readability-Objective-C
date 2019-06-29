//
//  ViewController.m
//  Readability-Objective-C Example
//
//  Created by brackendev.
//  Copyright (c) 2014-2019 brackendev. All rights reserved.
//

#import "ViewController.h"
#import "Readability.h"

@interface ViewController () <UITextViewDelegate>

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, weak) IBOutlet UITextView *textView;
@property (nonatomic, weak) IBOutlet UILabel *automatedReadabilityIndexLabel;
@property (nonatomic, weak) IBOutlet UILabel *colemanLiauIndexLabel;
@property (nonatomic, weak) IBOutlet UILabel *fleschReadingEaseLabel;
@property (nonatomic, weak) IBOutlet UILabel *fleschKincaidGradeLevelLabel;
@property (nonatomic, weak) IBOutlet UILabel *gunningFogScoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *smogGradeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self textViewDidChange:self.textView];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length) {
        [self.activityIndicator startAnimating];

        NSString *testText = self.textView.text;

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            NSDecimalNumber *automatedReadabilityIndex = [Readability automatedReadabilityIndexForString:testText][@"Score"];
            NSDecimalNumber *colemanLiauIndex = [Readability colemanLiauIndexForString:testText];
            NSDecimalNumber *fleschKincaidGradeLevel = [Readability fleschKincaidGradeLevelForString:testText];
            NSDecimalNumber *fleschReadingEase = [Readability fleschReadingEaseForString:testText][@"Score"];
            NSDecimalNumber *gunningFogScore = [Readability gunningFogScoreForString:testText];
            NSDecimalNumber *smogGrade = [Readability smogGradeForString:testText];

            dispatch_async(dispatch_get_main_queue(), ^(void) {
                [self.activityIndicator stopAnimating];

                [self.automatedReadabilityIndexLabel setText:[NSString stringWithFormat:@"%@", automatedReadabilityIndex]];
                [self.colemanLiauIndexLabel setText:[NSString stringWithFormat:@"%@", colemanLiauIndex]];
                [self.fleschKincaidGradeLevelLabel setText:[NSString stringWithFormat:@"%@", fleschKincaidGradeLevel]];
                [self.fleschReadingEaseLabel setText:[NSString stringWithFormat:@"%@", fleschReadingEase]];
                [self.gunningFogScoreLabel setText:[NSString stringWithFormat:@"%@", gunningFogScore]];
                [self.smogGradeLabel setText:[NSString stringWithFormat:@"%@", smogGrade]];
            });
        });
    } else {
        [self.activityIndicator stopAnimating];

        [self.automatedReadabilityIndexLabel setText:nil];
        [self.colemanLiauIndexLabel setText:nil];
        [self.fleschKincaidGradeLevelLabel setText:nil];
        [self.fleschReadingEaseLabel setText:nil];
        [self.gunningFogScoreLabel setText:nil];
        [self.smogGradeLabel setText:nil];
    }
}

@end

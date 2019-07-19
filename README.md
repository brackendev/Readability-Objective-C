Readability-Objective-C
=======================
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/d9b21f69a0c54ee08897e745e6285443)](https://www.codacy.com/app/brackendev/Readability-Objective-C?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=brackendev/Readability-Objective-C&amp;utm_campaign=Badge_Grade)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fbrackendev%2FReadability-Objective-C.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fbrackendev%2FReadability-Objective-C?ref=badge_shield)

**Metrics to determine readability and comprehension difficulty for contemporary English text.**

* [iOS](https://en.wikipedia.org/wiki/IOS) reference platform, 9.3 minimum version.
* Example app and tests included.

## Metrics Included

* [Automated Readability Index](http://en.wikipedia.org/wiki/Automated_Readability_Index)
* [Coleman–Liau Index](http://en.wikipedia.org/wiki/Coleman–Liau_index)
* [Flesch-Kincaid Grade Level](http://en.wikipedia.org/wiki/Flesch–Kincaid_readability_tests)
* [Flesch Reading Ease](http://en.wikipedia.org/wiki/Flesch–Kincaid_readability_tests)
* [Gunning Fog Index](http://en.wikipedia.org/wiki/Gunning_fog_index)
* [SMOG Grade](http://en.wikipedia.org/wiki/SMOG)

## Installation

* CocoaPods is the easiest way to use this project. Add the following to your project Podfile:

    ````Ruby
    pod 'Readability', :git => 'https://github.com/brackendev/Readability-Objective-C.git'
    ````

## Example Usage

1. Import it:

    ```Objective-C
    #import <Readability-Objective-C/Readability.h>
    ```

2. Use it:
    
    ```Objective-C
    [Readability automatedReadabilityIndexForString:@"Text"];
    [Readability colemanLiauIndexForString:@"Text"];
    [Readability fleschKincaidGradeLevelForString:@"Text"];
    [Readability fleschReadingEaseForString:@"Text"];
    [Readability gunningFogScoreForString:@"Text"];
    [Readability smogGradeForString:@"Text"];
    ```

## Acknowledgements

This project makes use of the following third-party libraries:

* [objC-syllable-counter](https://github.com/brackendev/objC-syllable-counter.git)
* [RegexKitLite](http://regexkit.sourceforge.net/RegexKitLite/)

## Ports

* [Pharo](http://brackendev.github.io/Readability-Pharo/)
* [Swift](http://brackendev.github.io/Readability-Swift/)
* [VisualWorks](https://brackendev.github.io/Readability-VisualWorks/)

## Author

[brackendev](https://www.github.com/brackendev)

## License

Readability-Objective-C is released under the MIT license. See the LICENSE file for more info.

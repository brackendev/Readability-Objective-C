Readability-Objective-C
=======================

**Determine readability and comprehension difficulty for contemporary English text.**

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

[CocoaPods](http://cocoapods.org) is the easiest way to use this project. Add the following to your project Podfile:

````Ruby
pod 'Readability-Objective-C', :git => 'https://github.com/brackendev/Readability-Objective-C.git'
````

It is a good idea to specifiy the commit. For example:

```Ruby
pod 'Readability-Objective-C', :git => 'https://github.com/brackendev/Readability-Objective-C.git', commit => '47d2b475ba7f4b3169321d61df552dd2a912cee9'
```

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
    
Note: See the [example view controller](https://github.com/brackendev/Readability-Objective-C/blob/master/Example/Readability-Objective-C/ReadabilityViewController.m).

## Acknowledgements

This project makes use of the following third-party libraries:

* [objC-syllable-counter](https://github.com/brackendev/objC-syllable-counter.git)
* [RegexKitLite](http://regexkit.sourceforge.net/RegexKitLite/)

## Ports

* [Objective-C](https://github.com/brackendev/Readability-Objective-C)
* [Pharo](https://github.com/brackendev/Readability-Pharo)
* [Swift](https://github.com/brackendev/Readability-Swift)
* [VisualWorks](https://github.com/brackendev/Readability-VisualWorks)

## Author

Bracken Spencer

* [GitHub](https://www.github.com/brackendev)
* [LinkedIn](https://www.linkedin.com/in/brackenspencer/)
* [Twitter](https://twitter.com/brackendev)

## License

Readability-Objective-C is released under the MIT license. See the LICENSE file for more info.

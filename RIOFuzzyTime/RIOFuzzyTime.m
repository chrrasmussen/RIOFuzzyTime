//
//  RIOFuzzyTime.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 03.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "RIOFuzzyTime.h"
#import "NSBundle+RIOFuzzyTime.h"


#define kBundleName             @"RIOFuzzyTime.bundle"
#define kScalesResourceName     @"Scales.plist"
#define kScalesRootKey          @"scales"


@interface RIOFuzzyTime ()

+ (NSArray *)scalesWithLocalization:(NSString *)localization;
+ (NSBundle *)bundle;

@end


@implementation RIOFuzzyTime

+ (NSString *)fuzzyTimeStringWithTimeInterval:(NSTimeInterval)timeInterval
{
    return [self fuzzyTimeStringWithTimeInterval:timeInterval localization:nil];
}

+ (NSString *)fuzzyTimeStringWithTimeInterval:(NSTimeInterval)timeInterval localization:(NSString *)localization
{
    BOOL past = (timeInterval <= 0) ? YES : NO;
    NSTimeInterval absoluteTimeInterval = fabs(timeInterval);
    
    // Loop through the scales until the limit exceeds the absolute time interval
    NSArray *scales = [self scalesWithLocalization:localization];
    for (NSDictionary *scale in scales)
    {
        NSUInteger limitValue = [[scale objectForKey:@"limit"] unsignedIntegerValue];
        if (limitValue > absoluteTimeInterval)
        {
            // Determine the appropriate format and insert the scaled time interval
            NSUInteger scaleValue = [[scale objectForKey:@"scale"] unsignedIntegerValue];
            NSUInteger scaledTimeInterval = absoluteTimeInterval / scaleValue;
            
            NSString *format = nil;
            if (scaledTimeInterval != 1)
            {
                // Plural form
                NSDictionary *pluralFormats = [scale objectForKey:@"pluralForm"];
                format = (past == YES) ? [pluralFormats objectForKey:@"past"] : [pluralFormats objectForKey:@"future"];
            }
            else
            {
                // Singular form
                NSDictionary *singularFormats = [scale objectForKey:@"singularForm"];
                format = (past == YES) ? [singularFormats objectForKey:@"past"] : [singularFormats objectForKey:@"future"];
            }
            
            return [NSString stringWithFormat:format, scaledTimeInterval];
        }
    }
    
    return [NSString stringWithFormat:@"Unsupported time interval '%f' for localization '%@'", timeInterval, localization];
}


#pragma mark - Private methods

+ (NSArray *)scalesWithLocalization:(NSString *)localization
{
    // Retreive the URL to the bundle with the desired localization
    NSBundle *bundle = [RIOFuzzyTime bundle];
    if (localization == nil)
        localization = [bundle preferredLocalization];
    NSURL *url = [bundle URLForResource:kScalesResourceName withExtension:nil subdirectory:nil localization:localization];
    
    // Get the contents of file
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfURL:url];
    NSArray *scales = [dict objectForKey:kScalesRootKey];
    
    return scales;
}

+ (NSBundle *)bundle
{
    static NSBundle *bundle = nil;
    if (bundle == nil)
    {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:kBundleName ofType:nil];
        if (bundlePath == nil)
            bundlePath = kBundleName; // Workaround to fix the unit tests
        bundle = [NSBundle bundleWithPath:bundlePath];
    }
    
    return bundle;
}

@end

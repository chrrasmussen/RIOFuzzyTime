//
//  RIOFuzzyTime.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 03.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "RIOFuzzyTime.h"
#import "NSBundle+RIOFuzzyTime.h"


@interface RIOFuzzyTime ()

+ (NSArray *)scales;
+ (NSString *)pathForResource:(NSString *)resource inBundleNamed:(NSString *)bundleName;

@end


@implementation RIOFuzzyTime

+ (NSString *)fuzzyTimeStringWithTimeInterval:(NSTimeInterval)timeInterval
{
    BOOL past = (timeInterval <= 0) ? YES : NO;
    NSTimeInterval absoluteTimeInterval = fabs(timeInterval);
    
    // Loop through the scales until the limit exceeds the absolute time interval
    NSArray *scales = [self scales];
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
                // Plural
                NSDictionary *pluralFormats = [scale objectForKey:@"pluralForm"];
                format = (past == YES) ? [pluralFormats objectForKey:@"past"] : [pluralFormats objectForKey:@"future"];
            }
            else
            {
                // Singular
                NSDictionary *singularFormats = [scale objectForKey:@"singularForm"];
                format = (past == YES) ? [singularFormats objectForKey:@"past"] : [singularFormats objectForKey:@"future"];
            }
            
            return [NSString stringWithFormat:format, scaledTimeInterval];
        }
    }
    
    return [NSString stringWithFormat:@"Unsupported time interval (%f)", timeInterval];
}

+ (NSString *)fuzzyTimeStringWithTimeInterval:(NSTimeInterval)timeInterval language:(NSString *)language
{
    return @"Not implemented";
}

#pragma mark - Private methods

+ (NSArray *)scales;
{
    static NSArray *scales = nil;
    if (scales == nil)
    {
        NSString *path = [self pathForResource:@"Scales.plist" inBundleNamed:@"RIOFuzzyTime.bundle"];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        scales = [dict objectForKey:@"scales"];
    }
    
    return scales;
}

+ (NSString *)pathForResource:(NSString *)resourceName inBundleNamed:(NSString *)bundleName
{
    // Find the bundle
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:nil];
    if (bundlePath == nil)
        bundlePath = bundleName; // Workaround to fix the unit tests
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    
    // Return the resource path
    NSString *resourcePath = [bundle pathForResourceInPreferredLanguage:resourceName];
    return resourcePath;
}

@end

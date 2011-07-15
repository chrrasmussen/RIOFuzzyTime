//
//  RIOFuzzyTime.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 03.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "RIOFuzzyTime.h"
//#import "NSBundle+RIOFuzzyTime.h"


#define kBundleName             @"RIOFuzzyTime.bundle"
#define kScalesResourceName     @"Scales.plist"
#define kScalesRootKey          @"scales"


@interface RIOFuzzyTime ()

+ (NSBundle *)bundle;
+ (NSString *)preferredLocalization;
+ (NSString *)localizationWithLocalization:(NSString *)localization;
+ (NSArray *)scalesWithLocalization:(NSString *)localization;
//+ (NSString *)pathForResource:(NSString *)resource inBundleNamed:(NSString *)bundleName;

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

#pragma mark - Private methods

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

+ (NSString *)preferredLocalization
{
    NSArray *availableLocalizations = [[RIOFuzzyTime bundle] localizations];
    __block NSString *preferredLocalization = nil;
    
    NSArray *preferredLanguages = [NSLocale preferredLanguages];
    [preferredLanguages enumerateObjectsUsingBlock:^(__strong id obj, NSUInteger idx, BOOL *stop) {
        if ([availableLocalizations containsObject:obj]) {
            preferredLocalization = obj;
            *stop = YES;
        }
    }];
    
    return preferredLocalization;
}

+ (NSString *)localizationWithLocalization:(NSString *)localization
{
    NSArray *availableLocalizations = [[RIOFuzzyTime bundle] localizations];
    if ([availableLocalizations containsObject:localization])
        return localization;
    
    return [RIOFuzzyTime preferredLocalization];
}

+ (NSArray *)scalesWithLocalization:(NSString *)localization
{
//    static NSMutableDictionary *cachedScales = nil;
//    if (cachedScales == nil)
//        cachedScales = [[NSMutableDictionary alloc] init];
//    
//    if ([cachedScales objectForKey:localization] != nil)
//        return []
    NSString *selectedLocalization = [RIOFuzzyTime localizationWithLocalization:localization];
    NSString *path = [[RIOFuzzyTime bundle] pathForResource:kScalesResourceName ofType:nil inDirectory:nil forLocalization:selectedLocalization];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *scales = [dict objectForKey:kScalesRootKey];
    
    return scales;
}

//+ (NSString *)pathForResource:(NSString *)resourceName inBundleNamed:(NSString *)bundleName
//{
//    // Find the bundle
//
//    
//    // Return the resource path
////    NSString *resourcePath = [bundle pathForResourceInPreferredLanguage:resourceName];
//    NSString *resourcePath = 
//    return resourcePath;
//}




@end

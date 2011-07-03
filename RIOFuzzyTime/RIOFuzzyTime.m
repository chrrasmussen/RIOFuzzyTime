//
//  RIOFuzzyTime.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 03.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "RIOFuzzyTime.h"

@interface RIOFuzzyTime ()

+ (NSArray *)scales;

@end


@implementation RIOFuzzyTime

+ (NSString *)fuzzyTimeForTimeInterval:(NSTimeInterval)timeInterval
{
    BOOL past = (timeInterval <= 0) ? YES : NO;
    NSTimeInterval absoluteTimeInterval = fabs(timeInterval);
    
    NSArray *scales = [self scales];
    for (NSDictionary *scale in scales)
    {
        NSUInteger limitValue = [[scale objectForKey:@"limit"] unsignedIntegerValue];
        if (limitValue > absoluteTimeInterval)
        {
            NSUInteger scaleValue = [[scale objectForKey:@"scale"] unsignedIntegerValue];
            NSUInteger scaledTimeInterval = absoluteTimeInterval / scaleValue;
            
            NSString *format;
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

+ (NSArray *)scales;
{
    static NSArray *scales = nil;
    if (scales == nil)
    {
        NSBundle *bundle = [NSBundle bundleWithPath:@"RIOFuzzyTime.bundle"];
        NSString *path = [bundle pathForResource:@"Scales" ofType:@"plist" inDirectory:@"" forLocalization:@"en"];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        scales = [dict objectForKey:@"scales"];
    }
    
    return scales;
}



@end

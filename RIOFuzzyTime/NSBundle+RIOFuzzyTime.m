//
//  NSBundle+RIOFuzzyTime.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 18.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "NSBundle+RIOFuzzyTime.h"


@implementation NSBundle (RIOFuzzyTime)

- (NSString *)preferredLocalization
{
    NSArray *availableLocalizations = [self localizations];
    NSString *preferredLocalization = nil;
    
    NSArray *preferredLanguages = [NSLocale preferredLanguages];
    for (NSString *language in preferredLanguages) {
        if ([availableLocalizations containsObject:language]) {
            preferredLocalization = language;
            break;
        }
    }
    
    return preferredLocalization;
}

@end

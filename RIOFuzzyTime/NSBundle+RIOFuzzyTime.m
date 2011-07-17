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

@end

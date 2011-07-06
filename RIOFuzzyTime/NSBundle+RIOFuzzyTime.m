//
//  NSBundle+RIOFuzzyTime.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 06.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "NSBundle+RIOFuzzyTime.h"


@implementation NSBundle (RIOFuzzyTime)

- (NSString *)preferredLanguage
{
    NSArray *availableLanguages = [self localizations];
    __block NSString *preferredLanguage = nil;
    
    NSArray *preferredLanguages = [NSLocale preferredLanguages];
    [preferredLanguages enumerateObjectsUsingBlock:^(__strong id obj, NSUInteger idx, BOOL *stop) {
        if ([availableLanguages containsObject:obj]) {
            preferredLanguage = obj;
            *stop = YES;
        }
    }];
    
    return preferredLanguage;
}

- (NSString *)pathForResourceInPreferredLanguage:(NSString *)resourceName
{
    return [self pathForResource:resourceName ofType:nil inDirectory:nil forLocalization:[self preferredLanguage]];
}

- (NSURL *)URLForResourceInPreferredLanguage:(NSString *)resourceName
{
    return [self URLForResource:resourceName withExtension:nil subdirectory:nil localization:[self preferredLanguage]];
}

@end

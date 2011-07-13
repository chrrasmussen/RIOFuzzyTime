//
//  NSBundle+RIOFuzzyTime.h
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 06.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 NSBundle category summary
 FIX
 */
@interface NSBundle (RIOFuzzyTime)

/**
 Returns the preferred language from the list of available localizations
 @returns Returns the preferred language
 */
- (NSString *)preferredLanguage;


/**
 Returns the path for the resource in the preferred language (Automatic selection)
 @param resourceName The name of the resource
 @returns MISSING
 */
- (NSString *)pathForResourceInPreferredLanguage:(NSString *)resourceName;


/**
 Returns the URL for the resource in the preferred language (Automatic selection)
 @param resourceName The name of the resource
 @returns MISSING
 */
- (NSURL *)URLForResourceInPreferredLanguage:(NSString *)resourceName;

@end

//
//  NSBundle+RIOFuzzyTime.h
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 18.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 The NSBundle(RIOFuzzyTime) category declares a single method to get the preferred localization. The preferred localization returns the current language (as specified in the Settings app) assuming that the language is supported by this library.
 */
@interface NSBundle (RIOFuzzyTime)


/** @name Getting the Preferred Localization
 *********************************************/


/**
 Returns a string containing the preferred localization.
 
 @returns A string containing the preferred localization.
 */
- (NSString *)preferredLocalization;

@end

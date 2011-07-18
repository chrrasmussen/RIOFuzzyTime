//
//  NSDate+RIOFuzzyTime.h
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 16.06.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 The NSDate(RIOFuzzyTime) category declares a single method to get the fuzzy time from an NSDate instance.
 */
@interface NSDate (RIOFuzzyTime)


/** @name Getting the Fuzzy Time
 *********************************/


/**
 Returns a string containing the fuzzy time of the receiver.
 
 @returns A string containing the fuzzy time of the receiver.
 */
- (NSString *)fuzzyTimeString;

@end

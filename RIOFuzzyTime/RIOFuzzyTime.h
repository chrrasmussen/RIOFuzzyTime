//
//  RIOFuzzyTime.h
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 03.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+RIOFuzzyTime.h"

/**
 Summary of RIOFuzzyTime.
 Test.
 */
@interface RIOFuzzyTime : NSObject

/** @name Convenience Methods */

/**
 Returns fuzzy time for a given time interval.
 
 Second paragraph.
 
 @param timeInterval Seconds since/to a given event.
 @returns A string containing the fuzzy time for the given time interval.
 */
+ (NSString *)fuzzyTimeForTimeInterval:(NSTimeInterval)timeInterval;

@end

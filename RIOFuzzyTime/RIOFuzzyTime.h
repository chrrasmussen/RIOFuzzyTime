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
 The RIOFuzzyTime class declare two methods to calculate the fuzzy time for a given time interval. E.g. About 30 minutes ago, About a day ago or About 2 months from now.
 */
@interface RIOFuzzyTime : NSObject


/** @name Calulating the Fuzzy Time
 ************************************/


/**
 Returns a string containing the fuzzy time for the given time interval using the preferred localization.
 
 @param timeInterval Seconds since/to a given event. The time interval value can either be positive (the future) or negative (the past).
 @returns A string containing the fuzzy time for the given time interval using the preferred localization.
 */
+ (NSString *)fuzzyTimeStringWithTimeInterval:(NSTimeInterval)timeInterval;


/**
 Returns a string containing the fuzzy time for the given time interval and localization.
 
 @param timeInterval Seconds since/to a given event. The time interval value can either be positive (the future) or negative (the past).
 @param localization The desired localization or nil to use the preferred localization.
 @returns A string containing the fuzzy time for the given time interval and localization.
 */
+ (NSString *)fuzzyTimeStringWithTimeInterval:(NSTimeInterval)timeInterval localization:(NSString *)localization;

@end

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
 Summary of RIOFuzzyTime
 */
@interface RIOFuzzyTime : NSObject

/**
 Returns fuzzy time for a given time interval
 @param timeInterval Seconds since/to a given event
 @returns MISSING
 */
+ (NSString *)fuzzyTimeForTimeInterval:(NSTimeInterval)timeInterval;

@end

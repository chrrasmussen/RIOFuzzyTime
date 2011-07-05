//
//  RIOFuzzyTime.h
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 16.06.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (RIOFuzzyTime)

/**
 A convenience method to obtain fuzzy time for an NSDate
 @returns MISSING
 */
- (NSString *)fuzzyTime;

@end

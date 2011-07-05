//
//  RIOFuzzyTime.h
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 03.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+RIOFuzzyTime.h"


@interface RIOFuzzyTime : NSObject

+ (NSString *)fuzzyTimeForTimeInterval:(NSTimeInterval)timeInterval;

@end

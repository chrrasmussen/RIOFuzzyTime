//
//  RIOFuzzyTime.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 16.06.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "NSDate+RIOFuzzyTime.h"
#import "RIOFuzzyTime.h"


@implementation NSDate (RIOFuzzyTime)

- (NSString *)fuzzyTime
{
    NSTimeInterval timeInterval = [self timeIntervalSinceNow];
    return [RIOFuzzyTime fuzzyTimeForTimeInterval:timeInterval];
}

@end

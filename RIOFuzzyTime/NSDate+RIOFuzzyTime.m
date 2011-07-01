//
//  RIOFuzzyTime.m
//  FriendlyLoan
//
//  Created by Christian Rasmussen on 16.06.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "NSDate+RIOFuzzyTime.h"


@implementation NSDate (RIOFuzzyTime)

// TODO: Add localization
- (NSString *)fuzzyTime
{
//    NSTimeInterval timeInterval = [self timeIntervalSinceNow];
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
//    NSTimeInterval secondsSinceNow = fabs(91.0);
//    NSUInteger seconds = secondsSinceNow;
//    NSUInteger minutes = secondsSinceNow / 60;
//    NSUInteger hours = secondsSinceNow / 3600;
//    NSUInteger days = secondsSinceNow / 86400;
//    NSUInteger weeks = secondsSinceNow / 604800;
    
    return @"test";//[NSString stringWithFormat:@"w:%d d:%d h:%d m:%d s:%d", weeks, days, hours, minutes, seconds];
}

@end

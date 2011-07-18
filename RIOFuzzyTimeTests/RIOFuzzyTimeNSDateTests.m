//
//  RIOFuzzyTimeNSDateTests.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 18.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "RIOFuzzyTimeNSDateTests.h"
#import "RIOFuzzyTime.h"


@implementation RIOFuzzyTimeNSDateTests

- (void)testNSDatePast
{
    NSDate *now = [NSDate date];
    NSDate *offsetDate = [now dateByAddingTimeInterval:-1234.0];
    NSString *fuzzyTime = [offsetDate fuzzyTimeString];
    
    STAssertEqualObjects(@"About 20 minutes ago", fuzzyTime, nil);
}

- (void)testNSDateFuture
{
    NSDate *now = [NSDate date];
    NSDate *offsetDate = [now dateByAddingTimeInterval:1234.0];
    NSString *fuzzyTime = [offsetDate fuzzyTimeString];
    
    STAssertEqualObjects(@"About 20 minutes since now", fuzzyTime, nil);
}

@end

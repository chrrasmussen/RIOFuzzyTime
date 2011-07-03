//
//  RIOFuzzyTimeShould.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 16.06.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "RIOFuzzyTimeShould.h"
#import "NSDate+RIOFuzzyTime.h"

@interface RIOFuzzyTimeShould ()

- (NSString *)fuzzyTimeForTimeInterval:(NSTimeInterval)timeInterval;

@end


@implementation RIOFuzzyTimeShould

- (void)testReturnJustNowPast
{
    NSString *low = [self fuzzyTimeForTimeInterval: -0.0];
    NSString *mid = [self fuzzyTimeForTimeInterval: -30.0];
    NSString *high = [self fuzzyTimeForTimeInterval:-59.0];
    
    STAssertEqualObjects(low, @"Just now", nil);
    STAssertEqualObjects(mid, @"Just now", nil);
    STAssertEqualObjects(high, @"Just now", nil);
}

- (void)testReturnJustNowFuture
{
    NSString *low = [self fuzzyTimeForTimeInterval: 0.5];
    NSString *mid = [self fuzzyTimeForTimeInterval: 30.5];
    NSString *high = [self fuzzyTimeForTimeInterval:59.5];
    
    STAssertEqualObjects(low, @"Just now", nil);
    STAssertEqualObjects(mid, @"Just now", nil);
    STAssertEqualObjects(high, @"Just now", nil);
}

- (void)testReturn1MinuteAgo
{
    float minute = 60.0;
    NSString *low = [self fuzzyTimeForTimeInterval: -(1.0 * minute + 1)];
    NSString *mid = [self fuzzyTimeForTimeInterval: -(1.5 * minute)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(2.0 * minute - 1)];
    
    STAssertEqualObjects(low, @"1 minute ago", nil);
    STAssertEqualObjects(mid, @"1 minute ago", nil);
    STAssertEqualObjects(high, @"1 minute ago", nil);
}

- (void)testReturn1MinuteSinceNow
{
    float minute = 60.0;
    NSString *low = [self fuzzyTimeForTimeInterval: 1.0 * minute + 1];
    NSString *mid = [self fuzzyTimeForTimeInterval: 1.5 * minute];
    NSString *high = [self fuzzyTimeForTimeInterval:2.0 * minute - 1];
    
    STAssertEqualObjects(low, @"1 minute since now", nil);
    STAssertEqualObjects(mid, @"1 minute since now", nil);
    STAssertEqualObjects(high, @"1 minute since now", nil);
}

- (void)testReturn59MinutesAgo
{
    float minute = 60;
    NSString *low = [self fuzzyTimeForTimeInterval: -(59.0 * minute + 1)];
    NSString *mid = [self fuzzyTimeForTimeInterval: -(59.5 * minute)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(60.0 * minute - 1)];
    
    STAssertEqualObjects(low, @"59 minutes ago", nil);
    STAssertEqualObjects(mid, @"59 minutes ago", nil);
    STAssertEqualObjects(high, @"59 minutes ago", nil);
}

- (void)testReturn59MinutesSinceNow
{
    float minute = 60;
    NSString *low = [self fuzzyTimeForTimeInterval: 59.0 * minute + 1];
    NSString *mid = [self fuzzyTimeForTimeInterval: 59.5 * minute];
    NSString *high = [self fuzzyTimeForTimeInterval:60.0 * minute - 1];
    
    STAssertEqualObjects(low, @"59 minutes since now", nil);
    STAssertEqualObjects(mid, @"59 minutes since now", nil);
    STAssertEqualObjects(high, @"59 minutes since now", nil);
}

- (void)testReturn1HourAgo
{
    float hour = 60*60;
    NSString *low = [self fuzzyTimeForTimeInterval: -(1.0 * hour + 1)];
    NSString *mid = [self fuzzyTimeForTimeInterval: -(1.5 * hour)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(2.0 * hour - 1)];
    
    STAssertEqualObjects(low, @"1 hour ago", nil);
    STAssertEqualObjects(mid, @"1 hour ago", nil);
    STAssertEqualObjects(high, @"1 hour ago", nil);
}

- (void)testReturn1HourSinceNow
{
    float hour = 60*60;
    NSString *low = [self fuzzyTimeForTimeInterval: 1.0 * hour + 1];
    NSString *mid = [self fuzzyTimeForTimeInterval: 1.5 * hour];
    NSString *high = [self fuzzyTimeForTimeInterval:2.0 * hour - 1];
    
    STAssertEqualObjects(low, @"1 hour since now", nil);
    STAssertEqualObjects(mid, @"1 hour since now", nil);
    STAssertEqualObjects(high, @"1 hour since now", nil);
}

- (void)testReturn23HoursAgo
{
    float hour = 60*60;
    NSString *low = [self fuzzyTimeForTimeInterval: -(23.0 * hour + 1)];
    NSString *mid = [self fuzzyTimeForTimeInterval: -(23.5 * hour)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(24.0 * hour - 1)];
    
    STAssertEqualObjects(low, @"23 hours ago", nil);
    STAssertEqualObjects(mid, @"23 hours ago", nil);
    STAssertEqualObjects(high, @"23 hours ago", nil);
}

- (void)testReturn23HoursSinceNow
{
    float hour = 60*60;
    NSString *low = [self fuzzyTimeForTimeInterval: 23.0 * hour + 1];
    NSString *mid = [self fuzzyTimeForTimeInterval: 23.5 * hour];
    NSString *high = [self fuzzyTimeForTimeInterval:24.0 * hour - 1];
    
    STAssertEqualObjects(low, @"23 hours since now", nil);
    STAssertEqualObjects(mid, @"23 hours since now", nil);
    STAssertEqualObjects(high, @"23 hours since now", nil);
}

- (void)testReturn1DayAgo
{
    float day = 60*60*24;
    NSString *low = [self fuzzyTimeForTimeInterval: -(1.0 * day + 1)];
    NSString *mid = [self fuzzyTimeForTimeInterval: -(1.5 * day)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(2.0 * day - 1)];
    
    STAssertEqualObjects(low, @"Yesterday", nil);
    STAssertEqualObjects(mid, @"Yesterday", nil);
    STAssertEqualObjects(high, @"Yesterday", nil);
}

- (void)testReturn1DaySinceNow
{
    float day = 60*60*24;
    NSString *low = [self fuzzyTimeForTimeInterval: 1.0 * day + 1];
    NSString *mid = [self fuzzyTimeForTimeInterval: 1.5 * day];
    NSString *high = [self fuzzyTimeForTimeInterval:2.0 * day - 1];
    
    STAssertEqualObjects(low, @"Tomorrow", nil);
    STAssertEqualObjects(mid, @"Tomorrow", nil);
    STAssertEqualObjects(high, @"Tomorrow", nil);
}


#pragma mark - Private methods

- (NSString *)fuzzyTimeForTimeInterval:(NSTimeInterval)timeInterval
{
    NSDate *now = [NSDate date];
    NSDate *offsetDate = [now dateByAddingTimeInterval:timeInterval];
    return [offsetDate fuzzyTime];
}

@end

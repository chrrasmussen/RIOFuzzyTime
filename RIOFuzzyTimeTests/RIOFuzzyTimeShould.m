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

#pragma mark - Test seconds

- (void)testReturnJustNowPast
{
    NSString *low  = [self fuzzyTimeForTimeInterval:-0.0];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-30.0];
    NSString *high = [self fuzzyTimeForTimeInterval:-59.0];
    
    STAssertEqualObjects(@"Just now", low, nil);
    STAssertEqualObjects(@"Just now", mid, nil);
    STAssertEqualObjects(@"Just now", high, nil);
}

- (void)testReturnJustNowFuture
{
    NSString *low  = [self fuzzyTimeForTimeInterval:0.5];
    NSString *mid  = [self fuzzyTimeForTimeInterval:30.5];
    NSString *high = [self fuzzyTimeForTimeInterval:59.5];
    
    STAssertEqualObjects(@"Just now", low, nil);
    STAssertEqualObjects(@"Just now", mid, nil);
    STAssertEqualObjects(@"Just now", high, nil);
}


#pragma mark - Test minutes

- (void)testReturn1MinuteAgo
{
    NSUInteger minute = 60;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(1.0 * minute + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(1.5 * minute)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(2.0 * minute - 1)];
    
    STAssertEqualObjects(@"1 minute ago", low, nil);
    STAssertEqualObjects(@"1 minute ago", mid, nil);
    STAssertEqualObjects(@"1 minute ago", high, nil);
}

- (void)testReturn1MinuteSinceNow
{
    NSUInteger minute = 60;
    NSString *low  = [self fuzzyTimeForTimeInterval:1.0 * minute + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:1.5 * minute];
    NSString *high = [self fuzzyTimeForTimeInterval:2.0 * minute - 1];
    
    STAssertEqualObjects(@"1 minute since now", low, nil);
    STAssertEqualObjects(@"1 minute since now", mid, nil);
    STAssertEqualObjects(@"1 minute since now", high, nil);
}

- (void)testReturn59MinutesAgo
{
    NSUInteger minute = 60;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(59.0 * minute + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(59.5 * minute)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(60.0 * minute - 1)];
    
    STAssertEqualObjects(@"59 minutes ago", low, nil);
    STAssertEqualObjects(@"59 minutes ago", mid, nil);
    STAssertEqualObjects(@"59 minutes ago", high, nil);
}

- (void)testReturn59MinutesSinceNow
{
    NSUInteger minute = 60;
    NSString *low  = [self fuzzyTimeForTimeInterval:59.0 * minute + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:59.5 * minute];
    NSString *high = [self fuzzyTimeForTimeInterval:60.0 * minute - 1];
    
    STAssertEqualObjects(@"59 minutes since now", low, nil);
    STAssertEqualObjects(@"59 minutes since now", mid, nil);
    STAssertEqualObjects(@"59 minutes since now", high, nil);
}


#pragma mark - Test hours

- (void)testReturn1HourAgo
{
    NSUInteger hour = 60*60;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(1.0 * hour + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(1.5 * hour)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(2.0 * hour - 1)];
    
    STAssertEqualObjects(@"1 hour ago", low, nil);
    STAssertEqualObjects(@"1 hour ago", mid, nil);
    STAssertEqualObjects(@"1 hour ago", high, nil);
}

- (void)testReturn1HourSinceNow
{
    NSUInteger hour = 60*60;
    NSString *low  = [self fuzzyTimeForTimeInterval:1.0 * hour + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:1.5 * hour];
    NSString *high = [self fuzzyTimeForTimeInterval:2.0 * hour - 1];
    
    STAssertEqualObjects(@"1 hour since now", low, nil);
    STAssertEqualObjects(@"1 hour since now", mid, nil);
    STAssertEqualObjects(@"1 hour since now", high, nil);
}

- (void)testReturn23HoursAgo
{
    NSUInteger hour = 60*60;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(23.0 * hour + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(23.5 * hour)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(24.0 * hour - 1)];
    
    STAssertEqualObjects(@"23 hours ago", low, nil);
    STAssertEqualObjects(@"23 hours ago", mid, nil);
    STAssertEqualObjects(@"23 hours ago", high, nil);
}

- (void)testReturn23HoursSinceNow
{
    NSUInteger hour = 60*60;
    NSString *low  = [self fuzzyTimeForTimeInterval:23.0 * hour + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:23.5 * hour];
    NSString *high = [self fuzzyTimeForTimeInterval:24.0 * hour - 1];
    
    STAssertEqualObjects(@"23 hours since now", low, nil);
    STAssertEqualObjects(@"23 hours since now", mid, nil);
    STAssertEqualObjects(@"23 hours since now", high, nil);
}


#pragma mark - Test days

- (void)testReturn1DayAgo
{
    NSUInteger day = 60*60*24;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(1.0 * day + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(1.5 * day)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(2.0 * day - 1)];
    
    STAssertEqualObjects(@"Yesterday", low, nil);
    STAssertEqualObjects(@"Yesterday", mid, nil);
    STAssertEqualObjects(@"Yesterday", high, nil);
}

- (void)testReturn1DaySinceNow
{
    NSUInteger day = 60*60*24;
    NSString *low  = [self fuzzyTimeForTimeInterval:1.0 * day + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:1.5 * day];
    NSString *high = [self fuzzyTimeForTimeInterval:2.0 * day - 1];
    
    STAssertEqualObjects(@"Tomorrow", low, nil);
    STAssertEqualObjects(@"Tomorrow", mid, nil);
    STAssertEqualObjects(@"Tomorrow", high, nil);
}

- (void)testReturn6DaysAgo
{
    NSUInteger day = 60*60*24;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(6.0 * day + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(6.5 * day)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(7.0 * day - 1)];
    
    STAssertEqualObjects(@"6 days ago", low, nil);
    STAssertEqualObjects(@"6 days ago", mid, nil);
    STAssertEqualObjects(@"6 days ago", high, nil);
}

- (void)testReturn6DaysSinceNow
{
    NSUInteger day = 60*60*24;
    NSString *low  = [self fuzzyTimeForTimeInterval:6.0 * day + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:6.5 * day];
    NSString *high = [self fuzzyTimeForTimeInterval:7.0 * day - 1];
    
    STAssertEqualObjects(@"6 days since now", low, nil);
    STAssertEqualObjects(@"6 days since now", mid, nil);
    STAssertEqualObjects(@"6 days since now", high, nil);
}


#pragma mark - Test weeks

- (void)testReturn1WeekAgo
{
    NSUInteger week = 60*60*24*7;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(1.0 * week + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(1.5 * week)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(2.0 * week - 1)];
    
    STAssertEqualObjects(@"Last week", low, nil);
    STAssertEqualObjects(@"Last week", mid, nil);
    STAssertEqualObjects(@"Last week", high, nil);
}

- (void)testReturn1WeekSinceNow
{
    NSUInteger week = 60*60*24*7;
    NSString *low  = [self fuzzyTimeForTimeInterval:1.0 * week + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:1.5 * week];
    NSString *high = [self fuzzyTimeForTimeInterval:2.0 * week - 1];
    
    STAssertEqualObjects(@"Next week", low, nil);
    STAssertEqualObjects(@"Next week", mid, nil);
    STAssertEqualObjects(@"Next week", high, nil);
}

- (void)testReturn4WeeksAgo
{
    NSUInteger week = 60*60*24*7;
    NSUInteger month = 60*60*24*365.25/12;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(4.0 * week + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(4.0 * week + (month - 4.0 * week) / 2)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(1.0 * month - 1)];
    
    STAssertEqualObjects(@"4 weeks ago", low, nil);
    STAssertEqualObjects(@"4 weeks ago", mid, nil);
    STAssertEqualObjects(@"4 weeks ago", high, nil);
}

- (void)testReturn4WeeksSinceNow
{
    NSUInteger week = 60*60*24*7;
    NSUInteger month = 60*60*24*365.25/12;
    NSString *low  = [self fuzzyTimeForTimeInterval:4.0 * week + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:4.0 * week + (month - 4.0 * week) / 2];
    NSString *high = [self fuzzyTimeForTimeInterval:1.0 * month - 1];
    
    STAssertEqualObjects(@"4 weeks since now", low, nil);
    STAssertEqualObjects(@"4 weeks since now", mid, nil);
    STAssertEqualObjects(@"4 weeks since now", high, nil);
}


#pragma mark - Test months

- (void)testReturn1MonthAgo
{
    NSUInteger month = 60*60*24*365.25/12;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(1.0 * month + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(1.5 * month)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(2.0 * month - 1)];
    
    STAssertEqualObjects(@"Last month", low, nil);
    STAssertEqualObjects(@"Last month", mid, nil);
    STAssertEqualObjects(@"Last month", high, nil);
}

- (void)testReturn1MonthSinceNow
{
    NSUInteger month = 60*60*24*365.25/12;
    NSString *low  = [self fuzzyTimeForTimeInterval:1.0 * month + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:1.5 * month];
    NSString *high = [self fuzzyTimeForTimeInterval:2.0 * month - 1];
    
    STAssertEqualObjects(@"Next month", low, nil);
    STAssertEqualObjects(@"Next month", mid, nil);
    STAssertEqualObjects(@"Next month", high, nil);
}

- (void)testReturn11MonthsAgo
{
    NSUInteger month = 60*60*24*365.25/12;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(11.0 * month + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(11.5 * month)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(12.0 * month - 1)];
    
    STAssertEqualObjects(@"11 months ago", low, nil);
    STAssertEqualObjects(@"11 months ago", mid, nil);
    STAssertEqualObjects(@"11 months ago", high, nil);
}

- (void)testReturn11MonthsSinceNow
{
    NSUInteger month = 60*60*24*365.25/12;
    NSString *low  = [self fuzzyTimeForTimeInterval:11.0 * month + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:11.5 * month];
    NSString *high = [self fuzzyTimeForTimeInterval:12.0 * month - 1];
    
    STAssertEqualObjects(@"11 months since now", low, nil);
    STAssertEqualObjects(@"11 months since now", mid, nil);
    STAssertEqualObjects(@"11 months since now", high, nil);
}


#pragma mark - Test years

- (void)testReturn1YearAgo
{
    NSUInteger year = 60*60*24*365.25;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(1.0 * year + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(1.5 * year)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(2.0 * year - 1)];
    
    STAssertEqualObjects(@"Last year", low, nil);
    STAssertEqualObjects(@"Last year", mid, nil);
    STAssertEqualObjects(@"Last year", high, nil);
}

- (void)testReturn1YearSinceNow
{
    NSUInteger year = 60*60*24*365.25;
    NSString *low  = [self fuzzyTimeForTimeInterval:1.0 * year + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:1.5 * year];
    NSString *high = [self fuzzyTimeForTimeInterval:2.0 * year - 1];
    
    STAssertEqualObjects(@"Next year", low, nil);
    STAssertEqualObjects(@"Next year", mid, nil);
    STAssertEqualObjects(@"Next year", high, nil);
}

- (void)testReturn9YearsAgo
{
    NSUInteger year = 60*60*24*365.25;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(9.0 * year + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(9.5 * year)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(10.0 * year - 1)];
    
    STAssertEqualObjects(@"9 years ago", low, nil);
    STAssertEqualObjects(@"9 years ago", mid, nil);
    STAssertEqualObjects(@"9 years ago", high, nil);
}

- (void)testReturn9YearsSinceNow
{
    NSUInteger year = 60*60*24*365.25;
    NSString *low  = [self fuzzyTimeForTimeInterval:9.0 * year + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:9.5 * year];
    NSString *high = [self fuzzyTimeForTimeInterval:10.0 * year - 1];
    
    STAssertEqualObjects(@"9 years since now", low, nil);
    STAssertEqualObjects(@"9 years since now", mid, nil);
    STAssertEqualObjects(@"9 years since now", high, nil);
}


#pragma mark - Test centuries

- (void)testReturn1CenturyAgo
{
    NSUInteger century = 60*60*24*365.25*10;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(1.0 * century + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(1.5 * century)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(2.0 * century - 1)];
    
    STAssertEqualObjects(@"Last century", low, nil);
    STAssertEqualObjects(@"Last century", mid, nil);
    STAssertEqualObjects(@"Last century", high, nil);
}

- (void)testReturn1CenturySinceNow
{
    NSUInteger century = 60*60*24*365.25*10;
    NSString *low  = [self fuzzyTimeForTimeInterval:1.0 * century + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:1.5 * century];
    NSString *high = [self fuzzyTimeForTimeInterval:2.0 * century - 1];
    
    STAssertEqualObjects(@"Next century", low, nil);
    STAssertEqualObjects(@"Next century", mid, nil);
    STAssertEqualObjects(@"Next century", high, nil);
}

- (void)testReturn9CenturiesAgo
{
    NSUInteger century = 60*60*24*365.25*10;
    NSString *low  = [self fuzzyTimeForTimeInterval:-(9.0 * century + 1)];
    NSString *mid  = [self fuzzyTimeForTimeInterval:-(9.5 * century)];
    NSString *high = [self fuzzyTimeForTimeInterval:-(10.0 * century - 1)];
    
    STAssertEqualObjects(@"9 centuries ago", low, nil);
    STAssertEqualObjects(@"9 centuries ago", mid, nil);
    STAssertEqualObjects(@"9 centuries ago", high, nil);
}

- (void)testReturn9CenturiesSinceNow
{
    NSUInteger century = 60*60*24*365.25*10;
    NSString *low  = [self fuzzyTimeForTimeInterval:9.0 * century + 1];
    NSString *mid  = [self fuzzyTimeForTimeInterval:9.5 * century];
    NSString *high = [self fuzzyTimeForTimeInterval:10.0 * century - 1];
    
    STAssertEqualObjects(@"9 centuries since now", low, nil);
    STAssertEqualObjects(@"9 centuries since now", mid, nil);
    STAssertEqualObjects(@"9 centuries since now", high, nil);
}


#pragma mark - Private methods

- (NSString *)fuzzyTimeForTimeInterval:(NSTimeInterval)timeInterval
{
    NSDate *now = [NSDate date];
    NSDate *offsetDate = [now dateByAddingTimeInterval:timeInterval];
    return [offsetDate fuzzyTime];
}

@end

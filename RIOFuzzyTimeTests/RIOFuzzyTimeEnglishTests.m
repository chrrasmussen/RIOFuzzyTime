//
//  RIOFuzzyTimeEnglishTests.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 16.06.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "RIOFuzzyTimeEnglishTests.h"
#import "RIOFuzzyTime.h"


#define RIOAssertFuzzyTime(expectedString, localizationString, low, mid, high) \
do { \
    NSString *lowString  = [RIOFuzzyTime fuzzyTimeStringWithTimeInterval:low localization:localizationString]; \
    NSString *midString  = [RIOFuzzyTime fuzzyTimeStringWithTimeInterval:mid localization:localizationString]; \
    NSString *highString = [RIOFuzzyTime fuzzyTimeStringWithTimeInterval:high localization:localizationString]; \
    STAssertEqualObjects(lowString, expectedString, @"(Low)"); \
    STAssertEqualObjects(midString, expectedString, @"(Mid)"); \
    STAssertEqualObjects(highString, expectedString, @"(High)"); \
} while(0)


@implementation RIOFuzzyTimeEnglishTests

#pragma mark - Test seconds

- (void)testReturnJustNowPast
{
    RIOAssertFuzzyTime(@"Just now", @"en", -0.0, -30.0, -59.0);
}

- (void)testReturnJustNowFuture
{
    RIOAssertFuzzyTime(@"Just now", @"en", 0.0, 30.0, 59.0);
}


#pragma mark - Test minutes

- (void)testReturn1MinuteAgo
{
    NSUInteger minute = 60;
    RIOAssertFuzzyTime(@"About a minute ago", @"en", -(1.0 * minute + 1), -(1.5 * minute), -(2.0 * minute - 1));
}

- (void)testReturn1MinuteSinceNow
{
    NSUInteger minute = 60;
    RIOAssertFuzzyTime(@"About a minute since now", @"en", 1.0 * minute + 1, 1.5 * minute, 2.0 * minute - 1);
}

- (void)testReturn59MinutesAgo
{
    NSUInteger minute = 60;
    RIOAssertFuzzyTime(@"About 59 minutes ago", @"en", -(59.0 * minute + 1), -(59.5 * minute), -(60.0 * minute - 1));
}

- (void)testReturn59MinutesSinceNow
{
    NSUInteger minute = 60;
    RIOAssertFuzzyTime(@"About 59 minutes since now", @"en", 59.0 * minute + 1, 59.5 * minute, 60.0 * minute - 1);
}


#pragma mark - Test hours

- (void)testReturn1HourAgo
{
    NSUInteger hour = 60*60;
    RIOAssertFuzzyTime(@"About an hour ago", @"en", -(1.0 * hour + 1), -(1.5 * hour), -(2.0 * hour - 1));
}

- (void)testReturn1HourSinceNow
{
    NSUInteger hour = 60*60;
    RIOAssertFuzzyTime(@"About an hour since now", @"en", 1.0 * hour + 1, 1.5 * hour, 2.0 * hour - 1);
}

- (void)testReturn23HoursAgo
{
    NSUInteger hour = 60*60;
    RIOAssertFuzzyTime(@"About 23 hours ago", @"en", -(23.0 * hour + 1), -(23.5 * hour), -(24.0 * hour - 1));
}

- (void)testReturn23HoursSinceNow
{
    NSUInteger hour = 60*60;
    RIOAssertFuzzyTime(@"About 23 hours since now", @"en", 23.0 * hour + 1, 23.5 * hour, 24.0 * hour - 1);
}


#pragma mark - Test days

- (void)testReturn1DayAgo
{
    NSUInteger day = 60*60*24;
    RIOAssertFuzzyTime(@"About a day ago", @"en", -(1.0 * day + 1), -(1.5 * day), -(2.0 * day - 1));
}

- (void)testReturn1DaySinceNow
{
    NSUInteger day = 60*60*24;
    RIOAssertFuzzyTime(@"About a day since now", @"en", 1.0 * day + 1, 1.5 * day, 2.0 * day - 1);
}

- (void)testReturn6DaysAgo
{
    NSUInteger day = 60*60*24;
    RIOAssertFuzzyTime(@"About 6 days ago", @"en", -(6.0 * day + 1), -(6.5 * day), -(7.0 * day - 1));
}

- (void)testReturn6DaysSinceNow
{
    NSUInteger day = 60*60*24;
    RIOAssertFuzzyTime(@"About 6 days since now", @"en", 6.0 * day + 1, 6.5 * day, 7.0 * day - 1);
}


#pragma mark - Test weeks

- (void)testReturn1WeekAgo
{
    NSUInteger week = 60*60*24*7;
    RIOAssertFuzzyTime(@"About a week ago", @"en", -(1.0 * week + 1), -(1.5 * week), -(2.0 * week - 1));
}

- (void)testReturn1WeekSinceNow
{
    NSUInteger week = 60*60*24*7;
    RIOAssertFuzzyTime(@"About a week since now", @"en", 1.0 * week + 1, 1.5 * week, 2.0 * week - 1);
}

- (void)testReturn4WeeksAgo
{
    NSUInteger week = 60*60*24*7;
    NSUInteger month = 60*60*24*365.25/12;
    RIOAssertFuzzyTime(@"About 4 weeks ago", @"en", -(4.0 * week + 1), -(4.0 * week + (month - 4.0 * week) / 2), -(1.0 * month - 1));
}

- (void)testReturn4WeeksSinceNow
{
    NSUInteger week = 60*60*24*7;
    NSUInteger month = 60*60*24*365.25/12;
    RIOAssertFuzzyTime(@"About 4 weeks since now", @"en", 4.0 * week + 1, 4.0 * week + (month - 4.0 * week) / 2, 1.0 * month - 1);
}


#pragma mark - Test months

- (void)testReturn1MonthAgo
{
    NSUInteger month = 60*60*24*365.25/12;
    RIOAssertFuzzyTime(@"About a month ago", @"en", -(1.0 * month + 1), -(1.5 * month), -(2.0 * month - 1));
}

- (void)testReturn1MonthSinceNow
{
    NSUInteger month = 60*60*24*365.25/12;
    RIOAssertFuzzyTime(@"About a month since now", @"en", 1.0 * month + 1, 1.5 * month, 2.0 * month - 1);
}

- (void)testReturn11MonthsAgo
{
    NSUInteger month = 60*60*24*365.25/12;
    RIOAssertFuzzyTime(@"About 11 months ago", @"en", -(11.0 * month + 1), -(11.5 * month), -(12.0 * month - 1));
}

- (void)testReturn11MonthsSinceNow
{
    NSUInteger month = 60*60*24*365.25/12;
    RIOAssertFuzzyTime(@"About 11 months since now", @"en", 11.0 * month + 1, 11.5 * month, 12.0 * month - 1);
}


#pragma mark - Test years

- (void)testReturn1YearAgo
{
    NSUInteger year = 60*60*24*365.25;
    RIOAssertFuzzyTime(@"About a year ago", @"en", -(1.0 * year + 1), -(1.5 * year), -(2.0 * year - 1));
}

- (void)testReturn1YearSinceNow
{
    NSUInteger year = 60*60*24*365.25;
    RIOAssertFuzzyTime(@"About a year since now", @"en", 1.0 * year + 1, 1.5 * year, 2.0 * year - 1);
}

- (void)testReturn99YearsAgo
{
    NSUInteger year = 60*60*24*365.25;
    RIOAssertFuzzyTime(@"About 99 years ago", @"en", -(99.0 * year + 1), -(99.5 * year), -(100.0 * year - 1));
}

- (void)testReturn99YearsSinceNow
{
    NSUInteger year = 60*60*24*365.25;
    RIOAssertFuzzyTime(@"About 99 years since now", @"en", 99.0 * year + 1, 99.5 * year, 100.0 * year - 1);
}


@end

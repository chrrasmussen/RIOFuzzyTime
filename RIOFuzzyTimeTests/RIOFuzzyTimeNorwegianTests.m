//
//  RIOFuzzyTimeNorwegianTests.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 18.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "RIOFuzzyTimeNorwegianTests.h"
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


@implementation RIOFuzzyTimeNorwegianTests

#pragma mark - Test seconds

- (void)testReturnJustNowPast
{
    RIOAssertFuzzyTime(@"Akkurat nå", @"nb", -0.0, -30.0, -59.0);
}

- (void)testReturnJustNowFuture
{
    RIOAssertFuzzyTime(@"Akkurat nå", @"nb", 0.0, 30.0, 59.0);
}


#pragma mark - Test minutes

- (void)testReturn1MinuteAgo
{
    NSUInteger minute = 60;
    RIOAssertFuzzyTime(@"Et minutt siden", @"nb", -(1.0 * minute + 1), -(1.5 * minute), -(2.0 * minute - 1));
}

- (void)testReturn1MinuteSinceNow
{
    NSUInteger minute = 60;
    RIOAssertFuzzyTime(@"Et minutt fra nå", @"nb", 1.0 * minute + 1, 1.5 * minute, 2.0 * minute - 1);
}

- (void)testReturn59MinutesAgo
{
    NSUInteger minute = 60;
    RIOAssertFuzzyTime(@"59 minutter siden", @"nb", -(59.0 * minute + 1), -(59.5 * minute), -(60.0 * minute - 1));
}

- (void)testReturn59MinutesSinceNow
{
    NSUInteger minute = 60;
    RIOAssertFuzzyTime(@"59 minutter fra nå", @"nb", 59.0 * minute + 1, 59.5 * minute, 60.0 * minute - 1);
}


#pragma mark - Test hours

- (void)testReturn1HourAgo
{
    NSUInteger hour = 60*60;
    RIOAssertFuzzyTime(@"En time siden", @"nb", -(1.0 * hour + 1), -(1.5 * hour), -(2.0 * hour - 1));
}

- (void)testReturn1HourSinceNow
{
    NSUInteger hour = 60*60;
    RIOAssertFuzzyTime(@"En time fra nå", @"nb", 1.0 * hour + 1, 1.5 * hour, 2.0 * hour - 1);
}

- (void)testReturn23HoursAgo
{
    NSUInteger hour = 60*60;
    RIOAssertFuzzyTime(@"23 timer siden", @"nb", -(23.0 * hour + 1), -(23.5 * hour), -(24.0 * hour - 1));
}

- (void)testReturn23HoursSinceNow
{
    NSUInteger hour = 60*60;
    RIOAssertFuzzyTime(@"23 timer fra nå", @"nb", 23.0 * hour + 1, 23.5 * hour, 24.0 * hour - 1);
}


#pragma mark - Test days

- (void)testReturn1DayAgo
{
    NSUInteger day = 60*60*24;
    RIOAssertFuzzyTime(@"En dag siden", @"nb", -(1.0 * day + 1), -(1.5 * day), -(2.0 * day - 1));
}

- (void)testReturn1DaySinceNow
{
    NSUInteger day = 60*60*24;
    RIOAssertFuzzyTime(@"En dag fra nå", @"nb", 1.0 * day + 1, 1.5 * day, 2.0 * day - 1);
}

- (void)testReturn6DaysAgo
{
    NSUInteger day = 60*60*24;
    RIOAssertFuzzyTime(@"6 dager siden", @"nb", -(6.0 * day + 1), -(6.5 * day), -(7.0 * day - 1));
}

- (void)testReturn6DaysSinceNow
{
    NSUInteger day = 60*60*24;
    RIOAssertFuzzyTime(@"6 dager fra nå", @"nb", 6.0 * day + 1, 6.5 * day, 7.0 * day - 1);
}


#pragma mark - Test weeks

- (void)testReturn1WeekAgo
{
    NSUInteger week = 60*60*24*7;
    RIOAssertFuzzyTime(@"En uke siden", @"nb", -(1.0 * week + 1), -(1.5 * week), -(2.0 * week - 1));
}

- (void)testReturn1WeekSinceNow
{
    NSUInteger week = 60*60*24*7;
    RIOAssertFuzzyTime(@"En uke fra nå", @"nb", 1.0 * week + 1, 1.5 * week, 2.0 * week - 1);
}

- (void)testReturn4WeeksAgo
{
    NSUInteger week = 60*60*24*7;
    NSUInteger month = 60*60*24*365.25/12;
    RIOAssertFuzzyTime(@"4 uker siden", @"nb", -(4.0 * week + 1), -(4.0 * week + (month - 4.0 * week) / 2), -(1.0 * month - 1));
}

- (void)testReturn4WeeksSinceNow
{
    NSUInteger week = 60*60*24*7;
    NSUInteger month = 60*60*24*365.25/12;
    RIOAssertFuzzyTime(@"4 uker fra nå", @"nb", 4.0 * week + 1, 4.0 * week + (month - 4.0 * week) / 2, 1.0 * month - 1);
}


#pragma mark - Test months

- (void)testReturn1MonthAgo
{
    NSUInteger month = 60*60*24*365.25/12;
    RIOAssertFuzzyTime(@"En måned siden", @"nb", -(1.0 * month + 1), -(1.5 * month), -(2.0 * month - 1));
}

- (void)testReturn1MonthSinceNow
{
    NSUInteger month = 60*60*24*365.25/12;
    RIOAssertFuzzyTime(@"En måned fra nå", @"nb", 1.0 * month + 1, 1.5 * month, 2.0 * month - 1);
}

- (void)testReturn11MonthsAgo
{
    NSUInteger month = 60*60*24*365.25/12;
    RIOAssertFuzzyTime(@"11 måneder siden", @"nb", -(11.0 * month + 1), -(11.5 * month), -(12.0 * month - 1));
}

- (void)testReturn11MonthsSinceNow
{
    NSUInteger month = 60*60*24*365.25/12;
    RIOAssertFuzzyTime(@"11 måneder fra nå", @"nb", 11.0 * month + 1, 11.5 * month, 12.0 * month - 1);
}


#pragma mark - Test years

- (void)testReturn1YearAgo
{
    NSUInteger year = 60*60*24*365.25;
    RIOAssertFuzzyTime(@"Et år siden", @"nb", -(1.0 * year + 1), -(1.5 * year), -(2.0 * year - 1));
}

- (void)testReturn1YearSinceNow
{
    NSUInteger year = 60*60*24*365.25;
    RIOAssertFuzzyTime(@"Et år fra nå", @"nb", 1.0 * year + 1, 1.5 * year, 2.0 * year - 1);
}

- (void)testReturn99YearsAgo
{
    NSUInteger year = 60*60*24*365.25;
    RIOAssertFuzzyTime(@"99 år siden", @"nb", -(99.0 * year + 1), -(99.5 * year), -(100.0 * year - 1));
}

- (void)testReturn99YearsSinceNow
{
    NSUInteger year = 60*60*24*365.25;
    RIOAssertFuzzyTime(@"99 år fra nå", @"nb", 99.0 * year + 1, 99.5 * year, 100.0 * year - 1);
}


@end

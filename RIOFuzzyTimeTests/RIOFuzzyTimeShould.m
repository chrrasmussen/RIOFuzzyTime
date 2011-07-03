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

- (void)testReturnJustNow
{
    NSString *m10s = [self fuzzyTimeForTimeInterval:-10.0];
    NSString *m30s = [self fuzzyTimeForTimeInterval:-30.0];
    NSString *m59s = [self fuzzyTimeForTimeInterval:-59.0];
    
    STAssertEqualObjects(m10s, @"Just now", nil);
    STAssertEqualObjects(m30s, @"Just now", nil);
    STAssertEqualObjects(m59s, @"Just now", nil);
    
    
    NSString *p10s = [self fuzzyTimeForTimeInterval:10.5];
    NSString *p30s = [self fuzzyTimeForTimeInterval:30.5];
    NSString *p59s = [self fuzzyTimeForTimeInterval:59.5];
    
    STAssertEqualObjects(p10s, @"Just now", nil);
    STAssertEqualObjects(p30s, @"Just now", nil);
    STAssertEqualObjects(p59s, @"Just now", nil);
}

- (void)testReturn1MinuteAgo
{
    NSString *m60s = [self fuzzyTimeForTimeInterval:-60.0];
    NSString *m90s = [self fuzzyTimeForTimeInterval:-90.0];
    NSString *m119s = [self fuzzyTimeForTimeInterval:-119.0];
    
    STAssertEqualObjects(m60s, @"1 minute ago", nil);
    STAssertEqualObjects(m90s, @"1 minute ago", nil);
    STAssertEqualObjects(m119s, @"1 minute ago", nil);
}

- (void)testReturn1MinuteSinceNow
{
    NSString *p60s = [self fuzzyTimeForTimeInterval:60.5];
    NSString *p90s = [self fuzzyTimeForTimeInterval:90.5];
    NSString *p119s = [self fuzzyTimeForTimeInterval:119.5];
    
    STAssertEqualObjects(p60s, @"1 minute since now", nil);
    STAssertEqualObjects(p90s, @"1 minute since now", nil);
    STAssertEqualObjects(p119s, @"1 minute since now", nil);
}

- (void)testReturn5MinutesAgo
{
    NSString *m300s = [self fuzzyTimeForTimeInterval:-300.0];
    NSString *m330s = [self fuzzyTimeForTimeInterval:-330.0];
    NSString *m359s = [self fuzzyTimeForTimeInterval:-359.0];
    
    STAssertEqualObjects(m300s, @"5 minutes ago", nil);
    STAssertEqualObjects(m330s, @"5 minutes ago", nil);
    STAssertEqualObjects(m359s, @"5 minutes ago", nil);
}

- (void)testReturn5MinutesSinceNow
{
    NSString *p300s = [self fuzzyTimeForTimeInterval:300.5];
    NSString *p330s = [self fuzzyTimeForTimeInterval:330.5];
    NSString *p359s = [self fuzzyTimeForTimeInterval:359.5];
    
    STAssertEqualObjects(p300s, @"5 minutes since now", nil);
    STAssertEqualObjects(p330s, @"5 minutes since now", nil);
    STAssertEqualObjects(p359s, @"5 minutes since now", nil);
}


#pragma mark - Private methods

- (NSString *)fuzzyTimeForTimeInterval:(NSTimeInterval)timeInterval
{
    NSDate *now = [NSDate date];
    NSDate *offsetDate = [now dateByAddingTimeInterval:timeInterval];
    return [offsetDate fuzzyTime];
}

@end

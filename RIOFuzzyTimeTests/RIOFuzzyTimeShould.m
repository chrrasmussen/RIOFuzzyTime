//
//  RIOFuzzyTimeShould.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 16.06.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "RIOFuzzyTimeShould.h"
#import "NSDate+RIOFuzzyTime.h"


@implementation RIOFuzzyTimeShould

@synthesize now;

- (void)setUp
{
    [super setUp];
    
    now = [NSDate date];
}

- (void)tearDown
{
    [super tearDown];
    
    
}


#pragma mark - Individual tests

- (void)testReturnJustNow
{
    NSDate *m10s = [now dateByAddingTimeInterval:-10.0];
    NSDate *m30s = [now dateByAddingTimeInterval:-30.0];
    NSDate *m59s = [now dateByAddingTimeInterval:-59.0];
    
    STAssertEqualObjects([m10s fuzzyTime], @"Just Now", nil);
    STAssertEqualObjects([m30s fuzzyTime], @"Just Now", nil);
    STAssertEqualObjects([m59s fuzzyTime], @"Just Now", nil);
}

//- (void)testReturn1MinuteAgo
//{
//    
//}
//
//- (void)testReturn1MinuteSinceNow
//{
//    
//}

@end

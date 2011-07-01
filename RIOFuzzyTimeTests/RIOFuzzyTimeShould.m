//
//  RIOFuzzyTimeShould.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 16.06.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "RIOFuzzyTimeShould.h"
#import "NSDate+RIOFuzzyTime.h"
#import "Test.h"

@implementation RIOFuzzyTimeShould

- (void)testReturnEmptyForToday
{
    NSLog(@"%@", [[Test alloc] init]);
//    NSLog(@"%@", [[NSDate date] fuzzyTime]);
    STFail(@"Fail");
//    STAssertEqualObjects(@"test", [[NSDate date] fuzzyTime], @"abc");
//    0-10s	Just now
//    10-20	1 minute ago
//    
//	1 hour ago
}

@end

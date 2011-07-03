//
//  RIOFuzzyTimeShould.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 16.06.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "RIOFuzzyTimeShould.h"
#import "NSDate+RIOFuzzyTime.h"

#import "RIOFuzzyTime.h"


@implementation RIOFuzzyTimeShould

- (void)testReturnEmptyForToday
{
    RIOFuzzyTime *ft = [[RIOFuzzyTime alloc] init];
    STFail(@"Fail");
//    STAssertEqualObjects(@"test", [[NSDate date] fuzzyTime], @"abc");
//    0-10s	Just now
//    10-20	1 minute ago
//    
//	1 hour ago
}

@end

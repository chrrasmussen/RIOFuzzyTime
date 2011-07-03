//
//  RIOFuzzyTime.m
//  RIOFuzzyTime
//
//  Created by Christian Rasmussen on 03.07.11.
//  Copyright 2011 Rasmussen I/O. All rights reserved.
//

#import "RIOFuzzyTime.h"

@interface RIOFuzzyTime ()

- (NSArray *)scales;

@end


@implementation RIOFuzzyTime

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        NSLog(@"%@", [self scales]);
//        NSLog(@"---");
//        NSLog(@"Bundle:%@ Path:%@", bundle, path);
//        NSLog(@"%@", dict);
//        NSLog(@"%@", [bundle localizations]);
//        NSLog(@"---");
    }
    
    return self;
}


#pragma mark - Private methods

- (NSArray *)scales;
{
    NSBundle *bundle = [NSBundle bundleWithPath:@"RIOFuzzyTime.bundle"];
    NSString *path = [bundle pathForResource:@"scales" ofType:@"plist" inDirectory:@"" forLocalization:@"en"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    return [dict objectForKey:@"scales"];
}



@end

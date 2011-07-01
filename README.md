# RIOFuzzyTime -- Get a descriptive text time since for a given NSDate


## Description

More text.


## Table of Contents

This readme file will contain:

* Introduction
* Mission
* Usage Examples


## Usage Examples

```obj-c
NSDate *time = [NSDate now];
NSLog(@"Time since:%@", [time descriptiveTimeSince]);
```

## States (Temp)

30 _time scale_ ago/from now

[60, 'just now', 1], // 60

[120, '1 minute ago', '1 minute from now'], // 60*2
[3600, 'minutes', 60], // 60*60, 60

[7200, '1 hour ago', '1 hour from now'], // 60*60*2
[86400, 'hours', 3600], // 60*60*24, 60*60

[172800, 'yesterday', 'tomorrow'], // 60*60*24*2
[604800, 'days', 86400], // 60*60*24*7, 60*60*24

[1209600, 'last week', 'next week'], // 60*60*24*7*4*2
[2419200, 'weeks', 604800], // 60*60*24*7*4, 60*60*24*7

[4838400, 'last month', 'next month'], // 60*60*24*7*4*2
[29030400, 'months', 2419200], // 60*60*24*7*4*12, 60*60*24*7*4

[58060800, 'last year', 'next year'], // 60*60*24*7*4*12*2
[2903040000, 'years', 29030400], // 60*60*24*7*4*12*100, 60*60*24*7*4*12

[5806080000, 'last century', 'next century'], // 60*60*24*7*4*12*100*2
[58060800000, 'centuries', 2903040000] // 60*60*24*7*4*12*100*20, 60*60*24*7*4*12*100
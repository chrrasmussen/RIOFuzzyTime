# RIOFuzzyTime -- Get a descriptive text time since for a given NSDate

Introduction/Description/Mission.

## Installation

Text.


## Usage Examples

```obj-c
NSDate *time = [NSDate now];
NSLog(@"Time since:%@", [time descriptiveTimeSince]);
```


## Specification

<table>
    <tr>
        <th>Time</th>
        <th>Singular form</th>
        <th>Limit</th>
        <th>Scale</th>
    </tr>
    <tr>
        <td>0-59 seconds</td>
        <td>Just Now</td>
        <td>60s</td>
        <td>1</td>
    </tr>
    <tr>
        <td>1-59 minutes</td>
        <td>1 minute</td>
        <td>60*60</td>
        <td>60</td>
    </tr>
    <tr>
        <td>1-23 hours</td>
        <td>1 hour</td>
        <td>60*60*24</td>
        <td>60*60</td>
    </tr>
    <tr>
        <td>1-6 days</td>
        <td>Yesterday</td>
        <td>60*60*24*7</td>
        <td>60*60*24</td>
    </tr>
    <tr>
        <td>1-4 weeks</td>
        <td>Last week</td>
        <td>60*60*24*7*5</td>
        <td>60*60*24*7</td>
    </tr>
    <tr>
        <td>1-11 months</td>
        <td>Last month</td>
        <td>60*60*24*365,25</td>
        <td>60*60*24*365,25/12</td>
    </tr>
    <tr>
        <td>1-9 years</td>
        <td>Last year</td>
        <td>60*60*24*365,25*10</td>
        <td>60*60*24*365,25</td>
    </tr>
    <tr>
        <td>1-X centuries</td>
        <td>Last century</td>
        <td>60*60*24*365,25*10</td>
        <td>60*60*24*365,25</td>
    </tr>
</table>


30 _time scale_ ago/from now

[60, 'just now', 1], // 60

1 [120, '1 minute ago', '1 minute from now'], // 60*2
X [3600, 'minutes', 60], // 60*60, 60

1 [7200, '1 hour ago', '1 hour from now'], // 60*60*2
X [86400, 'hours', 3600], // 60*60*24, 60*60

1 [172800, 'yesterday', 'tomorrow'], // 60*60*24*2
X [604800, 'days', 86400], // 60*60*24*7, 60*60*24

1 [1209600, 'last week', 'next week'], // 60*60*24*7*4*2
X [2419200, 'weeks', 604800], // 60*60*24*7*4, 60*60*24*7

1 [4838400, 'last month', 'next month'], // 60*60*24*7*4*2
X [29030400, 'months', 2419200], // 60*60*24*7*4*12, 60*60*24*7*4

1 [58060800, 'last year', 'next year'], // 60*60*24*7*4*12*2
X [2903040000, 'years', 29030400], // 60*60*24*7*4*12*100, 60*60*24*7*4*12

1 [5806080000, 'last century', 'next century'], // 60*60*24*7*4*12*100*2
X [58060800000, 'centuries', 2903040000] // 60*60*24*7*4*12*100*20, 60*60*24*7*4*12*100



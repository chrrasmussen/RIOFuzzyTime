# RIOFuzzyTime

Calculates the time since/to a given NSDate. E.g. 30 minutes ago, yesterday or 2 months from now.

The goal for this library is to support multiple languages. As of today it only supports English and Norwegian. If you want to contribute to the translations, please feel free to contact me.


## Installation

### In Xcode 4

Coming soon!


## Examples of Usage

Remember to import _RIOFuzzyTime.h_ before using any of these methods.

### NSDate category method

```obj-c
NSDate *now = [NSDate date];
NSLog(@"Fuzzy time: %@", [now fuzzyTime]);
```

Outputs:

```
Fuzzy time: Just now
```

### RIOFuzzyTime static method

```obj-c
NSLog(@"Fuzzy time: %@", [RIOFuzzyTime fuzzyTimeForTimeInterval:-1234.0]);
```

Outputs:

```
Fuzzy time: 20 minutes ago
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
        <td>Just now</td>
        <td>60</td>
        <td>1</td>
    </tr>
    <tr>
        <td>1-59 minutes</td>
        <td>1 minute ago</td>
        <td>60*60</td>
        <td>60</td>
    </tr>
    <tr>
        <td>1-23 hours</td>
        <td>1 hour ago</td>
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
        <td>60*60*24*365,25/12</td>
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
        <td>1-9 centuries</td>
        <td>Last century</td>
        <td>60*60*24*365,25*10*10</td>
        <td>60*60*24*365,25*10</td>
    </tr>
</table>

It is important that the limit of one category is higher than or equal to the scale of the next category. For example: In 1 month there are approximately 30.4375 days (2629800 seconds). In 4 weeks there are only 28 days (2419200 seconds). To accommodate this, we must add another week (which gives a total of 3024000 seconds) to the limit. Otherwise, an input of 29 days will return 0 months.


## License

This library is licensed under the Apache 2.0 license. See LICENSE for more details.
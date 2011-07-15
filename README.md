About RIOFuzzyTime
==================

Calculates the time since/to a given NSDate. E.g. `About 30 minutes ago`, `About a day ago` or `About 2 months from now`.

The goal for this library is to support multiple languages. As of today it only supports English and Norwegian. If you want to contribute to the translations or the code, please feel free to contact me.


Installation
============

__Note: Preliminary instructions__

These steps are targeted for Xcode 4, but they may also work for earlier versions.

Perform the steps of either section 1A or 1B depending on whether you need source control or not.


### 1A - Using source control

1. Open Terminal.app
2. Navigate to your project's root folder (where the .xcodeproj-file is located)
3. Type `git init` (Skip this step if you opted for: Create local git repository for this project)
4. Type `git submodule add git://github.com/skohorn/RIOFuzzyTime.git Components/RIOFuzzyTime`
5. Type `git submodule update --init --recursive`


### 1B - Without source control

_Instructions coming soon!_


### 2 - In Xcode

1. Drag the _RIOFuzzyTime.xcodeproj_ into your Xcode-project (either as a sub-project or as a new workspace)
2. Open the Build Settings in your project's settings
3. Add `-all_load` to the Other Linker Flags-setting
4. Add `Components` and enable Recursive in the User Header Search Paths-setting
5. Open the Build Phases in your project's settings
6. Add _RIOFuzzyTime.a_ in the Link Binary With Libraries-section
7. Add _RIOFuzzyTime.bundle_ in the Copy Bundle Resources-section


---


If you want a better explanation of each step, please check out [The state of iOS Open Source - and what to do about it!](http://blog.jayway.com/2011/05/16/the-state-of-ios-open-source-and-what-to-do-about-it/) from the awesome [Jayway Team Blog](http://blog.jayway.com/).


Examples of Usage
=================

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


Specification
=============

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
        <td>About a minute ago</td>
        <td>60*60</td>
        <td>60</td>
    </tr>
    <tr>
        <td>1-23 hours</td>
        <td>About an hour ago</td>
        <td>60*60*24</td>
        <td>60*60</td>
    </tr>
    <tr>
        <td>1-6 days</td>
        <td>About a day ago</td>
        <td>60*60*24*7</td>
        <td>60*60*24</td>
    </tr>
    <tr>
        <td>1-4 weeks</td>
        <td>About a week ago</td>
        <td>60*60*24*365,25/12</td>
        <td>60*60*24*7</td>
    </tr>
    <tr>
        <td>1-11 months</td>
        <td>About a month ago</td>
        <td>60*60*24*365,25</td>
        <td>60*60*24*365,25/12</td>
    </tr>
    <tr>
        <td>1-9 years</td>
        <td>About a year ago</td>
        <td>60*60*24*365,25*10</td>
        <td>60*60*24*365,25</td>
    </tr>
    <tr>
        <td>1-9 centuries</td>
        <td>About a century ago</td>
        <td>60*60*24*365,25*10*10</td>
        <td>60*60*24*365,25*10</td>
    </tr>
</table>

It is important that the limit of one category is higher than or equal to the scale of the next category. For example: In 1 month there are approximately 30.4375 days (2629800 seconds). In 4 weeks there are only 28 days (2419200 seconds). To accommodate this I have set the limit for the week category to about 4.35 weeks == 1 month (2629800 seconds). Otherwise, an input of 29 days would have returned 0 months.


License
=======

This library is licensed under the Apache 2.0 license. See LICENSE for more details.
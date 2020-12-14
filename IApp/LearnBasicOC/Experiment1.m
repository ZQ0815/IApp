//
//  Experiment1.m
//  IApp
//
//  Created by 张强 on 2020/12/14.
//  Copyright © 2020 codeam. All rights reserved.
//

#import "Experiment1.h"

@implementation Experiment1

- (void)mainFunction {
    NSDate *now = [NSDate date];
    NSLog(@"This NSDate object lives at %p", now);
    NSLog(@"This NSDate object lives at %@", now);
    double seconds = [now timeIntervalSince1970];
    NSLog(@"This NSDate object lives at %lf", seconds);
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSLog(@"My calendar is %@", [cal calendarIdentifier]);
    unsigned long day = [cal ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:now];
    NSLog(@"this is day %lu of the month", day);
}

@end

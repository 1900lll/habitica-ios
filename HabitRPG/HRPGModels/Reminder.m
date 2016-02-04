//
//  Reminder.m
//  Habitica
//
//  Created by Phillip Thelen on 23/12/15.
//  Copyright © 2015 Phillip Thelen. All rights reserved.
//

#import "Reminder.h"
#import "Task.h"

@implementation Reminder


- (void)willSave {
    UIApplication *sharedApplication = [UIApplication sharedApplication];
    if (self.inserted) {
        [self scheduleReminders];
    } else {
        for(UILocalNotification *reminder in [sharedApplication scheduledLocalNotifications]) {
            if([[reminder.userInfo objectForKey:@"ID"] isEqualToString:self.uuid]) {
                [sharedApplication cancelLocalNotification:reminder];
            }
        }
        if (self.updated) {
            [self scheduleReminders];
        }
    }
}

- (void) scheduleReminders {
    if ([self.task.type isEqualToString:@"daily"]) {
        for (int day = 0; day < 6; day++) {
            NSDate *checkedDate = [NSDate dateWithTimeIntervalSinceNow:(day * 86400)];
            if ([self.task dueOnDate:checkedDate]) {
                [self scheduleForDay:checkedDate];
            }
        }
    } else {
        if ([self.time compare:[NSDate date]] == NSOrderedDescending) {
            [self scheduleForDay:nil];
        }
    }
}

- (void) scheduleForDay:(NSDate *) day {
    NSDate *fireDate;
    if (day) {
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:day];
        NSDateComponents *timeComponents = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:self.time];
        [dateComponents setHour:timeComponents.hour];
        [dateComponents setMinute:timeComponents.minute];
        fireDate = [calendar dateFromComponents:dateComponents];
    } else {
        fireDate = self.time;
    }
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = fireDate;
    localNotification.alertBody = self.task.text;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.userInfo = @{@"ID": self.uuid, @"taskID": self.task.id};
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.category = @"completeCategory";
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

@end

//
//  MyThread.m
//  MyThreadAndSync
//
//  Created by Toshimi Ataku on 2017/05/16.
//  Copyright (c) 2017年 Toshimi Ataku. All rights reserved.
//

#import "MyThread.h"
#include <unistd.h>

@implementation MyThread
{
    NSThread *th;
}

-(instancetype)init
{
    th = nil;
    return [super init];
}

NSString *getCurrentTime()
{
    NSCalendar *cal;
    NSInteger hour, min, sec, nanosec;
    
    cal = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    [cal getHour:&hour minute:&min second:&sec nanosecond:&nanosec fromDate:[NSDate date]];
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hour, (long)min, (long)sec];
}

-(void)entry: arg
{
    NSString *msg;
    while (1) {
        [_simple setStringValue:msg];
        sleep(1);
    }
}

- (IBAction)runloopEntry:(id)sender {
    NSString *msg;
    msg = getCurrentTime();
    [NSThread detachNewThreadSelector:@selector(entry:) toTarget:self withObject:nil];
}

-(void)runLoopHandler
{
    ;
}

- (IBAction)runRunLoop:(id)sender {
    NSRunLoop *rl;
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runLoopHandler:) userInfo:nil repeats:YES];
    rl = [NSRunLoop currentRunLoop];
    [NSThread detachNewThreadSelector:@selector(entryRunLoop:) toTarget:self withObject:nil];
}
@end

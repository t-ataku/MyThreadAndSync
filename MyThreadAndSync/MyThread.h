//
//  MyThread.h
//  MyThreadAndSync
//
//  Created by Toshimi Ataku on 2017/05/16.
//  Copyright (c) 2017年 Toshimi Ataku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface MyThread : NSObject

@property (weak) IBOutlet NSTextField *simple;
@property (weak) IBOutlet NSTextField *runloop;

-(void)entry: arg;
- (IBAction)runloopEntry:(id)sender;
- (IBAction)runRunLoop:(id)sender;

@end

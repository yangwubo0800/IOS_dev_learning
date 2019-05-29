//
//  Children.m
//  18_Notification
//
//  Created by yangwubo on 19/5/5.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Children.h"

@implementation Children

-(id)init{
    self = [super init];
    if (self != nil) {
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(TimerAction:) userInfo:nil repeats:YES];
        self.happyValue = 100;
    }
    return self;
}


-(void)TimerAction:(NSTimer *)timer{
    _happyValue--;
    NSLog(@" happy value is %ld", (long)_happyValue);
    if (_happyValue < 80) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"happyNotification" object:self];
    }
}

@end

//
//  Nurse.m
//  18_Notification
//
//  Created by yangwubo on 19/5/5.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Nurse.h"
#import "Children.h"
@implementation Nurse

-(id)init{
    self = [super init];
    if (self != nil) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction:) name:@"happyNotification" object:nil];
    }
    return self;
}


-(void)notificationAction:(NSNotification *)notification{
    
    Children *chilren = notification.object;
    NSLog(@" notification action chilren happy value is %ld", chilren.happyValue);
    
}


-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"happyNotification" object:nil];
    
    NSLog(@"dealloc");
}

@end

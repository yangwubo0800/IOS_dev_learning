//
//  Children.m
//  09_Delegate
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Children.h"

@implementation Children

-(id)init{
    self = [super init];
    if (self != nil) {
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
    
    return self;
}


-(void)setDelegate:(id)delegate{
    _delegate = delegate;
    NSLog(@" children set delegate");
}

-(void)timerAction:(NSTimer *)timer{
    timeVaule ++;
    if (timeVaule % 3 == 0) {
        [_delegate wash:self];
    }
    
    if (timeVaule % 5 == 0){
        [_delegate play:self];
    }
}

@end

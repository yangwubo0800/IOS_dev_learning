//
//  Children.m
//  17_KVC&KVO
//
//  Created by yangwubo on 19/5/5.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Children.h"

@implementation Children

-(void)timerAction:(NSTimer *)timer{
    int value = _happyValue;
   // NSLog(@" value-- is %d", value--);
    [self setHappyValue: --value];
    
    NSInteger value2 = _hurryValue;
    [self setHurryValue:++value2];
}



-(id)init{
    self = [super init];
    if (self != nil) {
//        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//        self.happyValue = 100;
        
        //启动定时器
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        self.happyValue= 100;
    }
    
    return self;
    
}




@end

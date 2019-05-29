//
//  Nurse.m
//  09_Delegate
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Nurse.h"
#import "Children.h"

@implementation Nurse

-(void)wash:(Children *)children{
    NSLog(@" Nurse wash");
}

-(void)play:(Children *)chilren{
    NSLog(@" Nurse play");
}

@end

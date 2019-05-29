//
//  Person.m
//  06_classTarget
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Person.h"

@interface Person (private)

-(void)_showInfo;

@end

@implementation Person

-(void)work{
    [self _showInfo];
    NSLog(@" person work");
}

-(void)_showInfo{
    NSLog(@"person show info");
}

@end

//
//  Car.m
//  ClassCharacter
//
//  Created by yangwubo on 19/4/22.
//  Copyright © 2019年 yangwubo. All rights reserved.
//


#import "Car.h"

@implementation Car

-(void)setBrand:(NSString *)brand{
    _brand = brand;
}

-(void)setColor:(NSString *)color{
    _color = color;
}

-(void)brake{
    NSLog(@"car brake");
}

-(void)quicken{
    NSLog(@"car quicken");
}

@end

//
//  Truck.m
//  ClassCharacter
//
//  Created by yangwubo on 19/4/22.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Truck.h"

@implementation Truck

-(void)brake{
    NSLog(@"truck brake");
}

-(void)unload{
    [super brake];
    [self brake];
    NSLog(@"unload executed, brand is %@, color is %@", _brand, _color);
}

@end

//
//  Taxi.m
//  ClassCharacter
//
//  Created by yangwubo on 19/4/22.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Taxi.h"

@implementation Taxi

-(void)printTick{
    [super brake];
    [self brake];
    NSLog(@"Taxi print tick brand is %@, color is %@, company is %@", _brand, _color, _company);
}

@end

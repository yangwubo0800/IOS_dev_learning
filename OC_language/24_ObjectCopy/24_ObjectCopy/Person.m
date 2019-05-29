//
//  Person.m
//  24_ObjectCopy
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)copyWithZone:(NSZone *)zone{
    
    NSLog(@"person copywithzone");
    Person *p = [[self class] allocWithZone:zone];
    
    p.apples = [_apples mutableCopy];
    p.age = _age;
    
    [p.apples release];
    return p;
}

@end

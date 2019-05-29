//
//  Person.m
//  17_KVC&KVO
//
//  Created by yangwubo on 19/5/4.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString *)description{
    NSLog(@" description _name is %@", _name);
    NSLog(@" description age is %ld, dog is %@", _age, _dog);
    return _name;
}

@end

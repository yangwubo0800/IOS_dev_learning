//
//  Person.m
//  19_Predicate
//
//  Created by yangwubo on 19/5/5.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Person.h"

@implementation Person

+(id)personWithName:(NSString *)name andAge:(NSInteger)age{
    Person *person = [[Person alloc] init];
    person.name = name;
    person.age = age;
    
    return person;
}

-(NSString *)description{
    NSString *s = [NSString stringWithFormat:@"name is %@, age is %ld", _name, _age];
    return s;
}

@end

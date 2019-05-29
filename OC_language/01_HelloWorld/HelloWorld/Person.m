//
//  Person.m
//  HelloWorld
//
//  Created by yangwubo on 19/4/17.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)shopping:(float)price{
    NSLog(@"%@ shopping %f", _name, price);
}

-(void)setName:(NSString *)name{
    _name = name;
    NSLog(@"set name executed name is %@", _name);
}

-(void)setAge:(NSInteger)age{
    _age = age;
    NSLog(@"set age executed age is %ld", _age);
}

-(NSString*)name{
    NSLog(@" get name executed");
    return _name;
}

-(NSInteger)age{
    NSLog(@" get age executed");
    return _age;
}

-(void)setName:(NSString *)name setAge:(NSInteger)age{
    _name = name;
    _age = age;
}

-(id)initWithName:(NSString *)name withAge:(NSInteger)age{
    self = [super init];
    if (self != nil) {
        _name = name;
        _age = age;
    }
    
    return self;
}

//-(void)test{
//    NSLog(@"test");
//}

-(NSString *)showInfo{
//    [self test];
    NSLog(@" show info executed , name is %@, age is %ld", _name, (long)_age);
    return _name;
}

+(Person*)newPerson{
    return [[Person alloc] init];
}

@end

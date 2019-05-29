//
//  Person.m
//  15_Archiver
//
//  Created by yangwubo on 19/4/30.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithCoder:(NSCoder *)aDecoder{
    NSLog(@" init with coder");
    self = [super init];
    if (self != nil) {
        _name = [[aDecoder decodeObjectForKey:@"name"] copy];
        self.age = [aDecoder decodeObjectForKey:@"age"];
        self.apple = [aDecoder decodeObjectForKey:@"apple"];
    }
    
    return  self;
}


-(void)encodeWithCoder:(NSCoder *)aCoder{
    NSLog(@" encode with coder");
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeObject:_apple forKey:@"apple"];
    
}

-(NSString *)description{
    NSLog(@"description");
    NSString *string = [NSString stringWithFormat:@"name=%@,age=%ld,apples=%@",_name,(long)_age,_apple];
    return string;
}

@end

//
//  Person.m
//  10_NSObjectMethod
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)invoke{
    NSLog(@"person invoke executed");
    [self demo1];
    
    
    NSString *result = [self performSelector:@selector(demo1)];
    NSLog(@" result is %@", result);
    
    [self performSelector:@selector(demo2:) withObject:@"demo2 string"];
    
    [self performSelector:@selector(demo3:withName:) withObject:@"demo3 str" withObject:@"demo3 name"];
    
    
    [self performSelector:@selector(demo1) withObject:NULL afterDelay:2.5];
    
    [[NSRunLoop currentRunLoop] run];
    
}


-(NSString *)demo1{
    NSLog(@"person demo1 executed");
    
    return @"demo1";
    
}

-(void)demo2:(NSString *)str{
    NSLog(@" person demo2 str is %@", str);
}


-(void)demo3:(NSString *)str withName:(NSString *)name{
    NSLog(@" person demo3 str is %@, name is %@", str, name);
}

@end

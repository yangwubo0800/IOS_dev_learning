//
//  main.m
//  10_NSObjectMethod
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSObject *obj1 = [[NSObject alloc] init];
        NSObject *obj2 = [[NSObject alloc] init];
        
        if ([obj1 isEqual:obj2]) {
            NSLog(@" obj1 equals obj2");
        }else{
            NSLog(@" obj1 not equal obj2");
        }
        
        
        if (obj1 == obj1) {
            NSLog(@" obj1 == obj1");
        } else{
            NSLog(@" obj1 != obj2");
        }
        
        
        Person *person = [[Person alloc] init];
//        [person invoke];
        
        
        Person *rose = [[Person alloc] init];
        BOOL isBelong = [rose isMemberOfClass:[NSObject class]];
        if (isBelong) {
            NSLog(@" rose belong the class");
        } else{
            NSLog(@" rose do not belongs the class");
        }
        
        
        BOOL isChild = [rose isKindOfClass:[Person class]];
        if (isChild) {
            NSLog(@" rose is child of the class");
        } else{
            NSLog(@" rose is not a child of the class");
        }
        
        
        Person *task = [[Person alloc] init];
        BOOL exist = [task respondsToSelector:@selector(demo1)];
        if (exist) {
            [task performSelector:@selector(demo1)];
            NSLog(@" YES ");
        } else {
            NSLog(@" NO ");
        }
        
        
    }
    return 0;
}

//
//  main.m
//  23_RecycleReference
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"

int main(int argc, const char * argv[]) {

    Dog *dog = [[Dog alloc] init];
    Person *person = [[Person alloc] init];
    
    [dog setPerson:person];
    [person setDog:dog];
    
    NSLog(@"1 dog arc is %ld", [dog retainCount]);
    NSLog(@"1 Person arc is %ld", [person retainCount]);
    
    [dog release];
    [person release];
    
//    NSLog(@"2 dog arc is %ld", [dog retainCount]);
//    NSLog(@"2 Person arc is %ld", [person retainCount]);
    
    return 0;
}

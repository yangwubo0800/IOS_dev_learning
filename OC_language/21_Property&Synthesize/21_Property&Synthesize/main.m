//
//  main.m
//  21_Property&Synthesize
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "User.h"

int main(int argc, const char * argv[]) {
   
    // insert code here...
    NSLog(@"Hello, World!");
    
    Dog *dog = [[Dog alloc] init];
    User *user = [[User alloc] init];
    
    NSLog(@"dog retain count is %ld",[dog retainCount]);
    
    [user setDog:dog];
    NSLog(@"after set dog retain count is %ld",[dog retainCount]);
    
    [user setUserName:@"test user"];
    NSString *name = user.userName;
    NSLog(@"user name is %@", name);
    
    
    return 0;
}

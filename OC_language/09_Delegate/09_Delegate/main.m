//
//  main.m
//  09_Delegate
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Children.h"
#import "Nurse.h"
#import "Nanny.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Children *chilren = [[Children alloc] init];
        
        Nurse *nurse = [[Nurse alloc] init];
        Nanny *nanny =[[Nanny alloc] init];
        
        [chilren setDelegate:nanny];
        [chilren setDelegate:nurse];
        
        
        [[NSRunLoop currentRunLoop] run];
        
        
    }
    return 0;
}

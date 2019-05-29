//
//  main.m
//  18_Notification
//
//  Created by yangwubo on 19/5/5.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Nurse.h"
#import "Children.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Children *chilren = [[Children alloc] init];
        
        Nurse *nurse = [[Nurse alloc]init];
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}

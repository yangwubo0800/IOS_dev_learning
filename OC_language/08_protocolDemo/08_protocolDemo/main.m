//
//  main.m
//  08_protocolDemo
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Student *student = [[Student alloc] init];
        [student finishTask];
        [student dontLate];
        
        if ([student respondsToSelector:@selector(wearNeat)]) {
            [student wearNeat];
        }
    }
    return 0;
}

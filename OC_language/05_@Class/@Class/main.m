//
//  main.m
//  @Class
//
//  Created by yangwubo on 19/4/22.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Classes.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Classes *classes = [[Classes alloc] init];
        Student *student = [[Student alloc] init];
        classes->_student = student;
        [classes t1];
        
    }
    return 0;
}

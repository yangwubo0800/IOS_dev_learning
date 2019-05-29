//
//  main.m
//  06_classTarget
//
//  Created by yangwubo on 19/4/23.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Extension.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSString *email = @"78797879@qq.com";
        BOOL isEmail = [email validateEmail];
        if (isEmail) {
            NSLog(@" this is an email");
        } else {
            NSLog(@" this is not an email");
        }
        
        
        NSInteger i = [email intValue];
        NSLog(@" email value is %ld", (long)i);
        
        
        Person *person = [[Person alloc] init];
        [person work];
        
    }
    return 0;
}

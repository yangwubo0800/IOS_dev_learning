//
//  main.m
//  25_Singelton
//
//  Created by yangwubo on 19/5/6.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressBook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        AddressBook *book1 = [[AddressBook alloc] init];
        AddressBook *book2 = [[AddressBook alloc] init];
        
        NSLog(@" book1 is %@", book1);
        NSLog(@" book2 is %@", book2);
        
        if (book1 == book2) {
            NSLog(@" book1 equals book2");
        }
        
    }
    return 0;
}

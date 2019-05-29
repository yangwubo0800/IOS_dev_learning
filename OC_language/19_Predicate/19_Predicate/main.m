//
//  main.m
//  19_Predicate
//
//  Created by yangwubo on 19/5/5.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSArray *persons = [NSArray arrayWithObjects:
                            [Person personWithName:@"mac" andAge:20],
                            [Person personWithName:@"1" andAge:30],
                            [Person personWithName:@"2" andAge:40],
                            [Person personWithName:@"sine" andAge:50],
                            [Person personWithName:@"4" andAge:60],
                            [Person personWithName:@"sSophiine" andAge:70],
                            [Person personWithName:@"6" andAge:20],
                            [Person personWithName:@"7" andAge:40],
                            [Person personWithName:@"jkksdjkjk" andAge:60],
                            [Person personWithName:@"9" andAge:40],
                            [Person personWithName:@"0sss" andAge:80],
                            [Person personWithName:@"10" andAge:90],
                            [Person personWithName:@"1" andAge:20],
                            nil];
        
        // PREDICATE
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age<%d", 30];
        NSArray *array = [persons filteredArrayUsingPredicate:predicate];
//        NSLog(@" array is %@", array);
        
        // &
        predicate = [NSPredicate predicateWithFormat:@"name='1' && age<30"];
        array = [persons filteredArrayUsingPredicate:predicate];
//        NSLog(@" array & is %@", array);

        // IN
        predicate = [NSPredicate predicateWithFormat:@"name in {'1', '2'} || age in {30, 40}"];
        array = [persons filteredArrayUsingPredicate:predicate];
//        NSLog(@" array in is %@", array);
        
        //begin withs
        predicate = [NSPredicate predicateWithFormat:@"name beginswith '1'"];
        array = [persons filteredArrayUsingPredicate:predicate];
        NSLog(@" array begins with is %@", array);
        
        
        //ends with
        predicate = [NSPredicate predicateWithFormat:@"name endswith '1'"];
        array = [persons filteredArrayUsingPredicate:predicate];
        NSLog(@" array ends with is %@", array);
        
        //contains
        predicate = [NSPredicate predicateWithFormat:@"name contains '1'"];
        array = [persons filteredArrayUsingPredicate:predicate];
        NSLog(@" array contains is %@", array);
        
        //like
        predicate = [NSPredicate predicateWithFormat:@"name like '?s*'"];
        array = [persons filteredArrayUsingPredicate:predicate];
        NSLog(@" array like is %@", array);
        
        
        
        
    }
    return 0;
}

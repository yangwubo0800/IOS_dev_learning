//
//  main.m
//  12_NSArray
//
//  Created by yangwubo on 19/4/25.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSString *str1 = @"yangwuliu";
        NSString *str2 = @"hello";
        NSString *str3 = @"world";
        
//        NSArray *array1 = [[NSArray alloc] initWithObjects:str1, str2, str3, nil];
//        array1 = [NSArray arrayWithObjects:str1, str2, nil];
//        NSLog(@" array1 is %@", array1);
//        
//        
//        NSArray *array2 = [NSArray arrayWithArray:array1];
//        NSLog(@" array2 is %@", array2);
        
        
//        NSString *str4 = [array2 objectAtIndex:1];
//        NSLog(@" str4 is %@", str4);
//        
//        NSUInteger count = [array2 count];
//        BOOL isContains = [array2 containsObject:@"hello"];
//        
//        NSLog(@" count is %lu, isContains is %hhd", (unsigned long)count, isContains);
//        
//        NSUInteger index = [array2 indexOfObject:@"hello"];
//        if (index == NSNotFound) {
//            NSLog(@" NOT FOUND");
//        }else{
//            NSLog(@" index is %lu", (unsigned long)index);
//        }
        
//        NSString *content = [array1 componentsJoinedByString:@","];
//        content = [array1 lastObject];
//        NSLog(@" content is %@", content);
//        
//        NSArray *array3 = [array1 arrayByAddingObject:@"guy"];
//        NSLog(@" array 3 is %@", array3);
//        
//        
//        for (int i=0; i<[array3 count]; i++) {
//            NSString *temp = [array3 objectAtIndex:i];
//            NSLog(@" ==== temp is %@", temp);
//        }
//        
//        for (NSString *s in array3) {
//            NSLog(@"--- %@", s);
//        }
//        
//        
//        NSArray *array5 = @[str1, str2, str3];
//        NSLog(@" array5 one is %@", array5[0]);
        
        
        NSMutableArray 	*mutableArr = [[NSMutableArray alloc] initWithObjects:str1, str2, str3, nil];
        NSLog(@" mutable array is %@", mutableArr);
        //warning
        //NSMutableArray *arr2 = @[str1, str2];
        
        NSMutableArray *arr3 = [[NSMutableArray alloc] initWithCapacity:5];
        NSMutableArray *arr4 = [NSMutableArray arrayWithCapacity:5];
        
        [mutableArr addObject:str1];
        NSLog(@"===== mutable array is %@", mutableArr);
        [arr3 addObjectsFromArray:mutableArr];
        [arr3 addObject:mutableArr];
        [arr3 insertObject:@"insert" atIndex:0];
        [arr3 replaceObjectAtIndex:1 withObject:@"replace"];
        [arr3 exchangeObjectAtIndex:0 withObjectAtIndex:1];
        [arr3 removeObjectAtIndex:0];
        [arr3 removeLastObject];
        [arr3 removeObject:@"4444"];
        [arr3 removeAllObjects];
        
        NSLog(@"-----arr3 is %@", arr3);
        
        
        
        
        
    }
    return 0;
}

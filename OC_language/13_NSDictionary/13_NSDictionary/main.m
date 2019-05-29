//
//  main.m
//  13_NSDictionary
//
//  Created by yangwubo on 19/4/25.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSArray *arr1 = [NSArray arrayWithObjects:@"zhangsan", @"zhangwei", nil];
        NSArray *arr2 = [NSArray arrayWithObjects:@"lisi", @"liping", nil];
        
//        NSDictionary *nd = [NSDictionary dictionaryWithObjectsAndKeys:arr1, @"zhang", arr2, @"li", nil];
//        NSLog(@"dictionary is %@", nd);
//        
//        
//        NSDictionary *dict2 = [NSDictionary dictionaryWithObject:arr1 forKey:@"zhang"];
//        NSLog(@" dict2 is %@", dict2);
//        
//        NSArray *allKeys = [nd allKeys];
//        NSLog(@" all keys is %@", allKeys);
//        
//        NSArray *allValues = [nd allValues];
//        NSLog(@" all values is %@", allValues);
//        
//        NSArray *value = [nd objectForKey:@"zhang"];
//        NSLog(@" value is %@", value);
//        
//        // key - value
//        NSDictionary *dict4 = @{@"zhang":arr1, @"li":arr2};
//        NSLog(@"=====dict 4 is %@", dict4);
//        NSArray *arr4 = dict4[@"zhang"];
//        NSLog(@"====arr4 is %@", arr4);
        
        //mutable dictionary
        NSMutableDictionary *md = [[NSMutableDictionary alloc] initWithCapacity:3];
        
        [md setObject:arr1 forKey:@"zhang"];
        [md setObject:arr2 forKey:@"second"];
        NSLog(@" ---- md is %@", md);
        
        NSMutableDictionary *md2 = [[NSMutableDictionary alloc] initWithCapacity:3];
        [md2 addEntriesFromDictionary:md];
        [md2 removeObjectForKey:@"zhang"];
        //no effect
        [md2 removeObjectsForKeys:arr2];
        //[md2 removeAllObjects];
        NSLog(@"=====md2 is %@", md2);
        
        for (NSString *keys in md2) {
            NSLog(@" keys is %@", keys);
            NSArray *values = [md2 objectForKey:keys];
            for (NSString *v in values) {
                NSLog(@"v is %@", v);
            }
        }
        
        
        NSArray *keys = [md2 allKeys];
        for (NSInteger i = 0; i< keys.count; i++) {
            NSArray *values = [md2 objectForKey:keys[i]];
            for (NSString *v in values) {
                NSLog(@"===== v is %@", v);
            }
        }
        
        
        
        
        
    }
    return 0;
}

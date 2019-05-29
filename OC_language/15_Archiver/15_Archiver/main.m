//
//  main.m
//  15_Archiver
//
//  Created by yangwubo on 19/4/30.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSArray *array = [NSArray arrayWithObjects:@"zhangsan", @"lisi", @"wangwu", nil ];
        NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
        
        BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
        if (success) {
            NSLog(@" archive success");
        }
        
        
        id array1 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        NSLog(@" unarchive array1 is %@", array1);
        
        
        NSMutableData *data = [NSMutableData data];
        NSKeyedArchiver *archiver1 = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [archiver1 encodeObject:array forKey:@"array"];
        [archiver1 encodeInteger:100 forKey:@"age"];
        [archiver1 encodeObject:@"jack" forKey:@"name"];
        
        [archiver1 finishEncoding];
        //[archiver1 release];
        
        NSString *filePath1 = [NSHomeDirectory() stringByAppendingPathComponent:@"array1.src"];
        BOOL success1 = [data writeToFile:filePath1 atomically:YES];
        if(success1){
            NSLog(@"归档成功");
        }
        
        
        //unarchiver
        NSData *data1 = [[NSData alloc] initWithContentsOfFile:filePath1];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data1];
        
        NSArray *arr = [unarchiver decodeObjectForKey:@"array"];
        NSLog(@" arr is %@", arr);
        
//        NSInteger age = [unarchiver decodeObjectForKey:@"age"];
//        
//        NSLog(@" age is %ld", age);
        
        NSString *name = [unarchiver decodeObjectForKey:@"name"];
        NSLog(@" name is %@", name);
        
        
        
        Person *p = [[Person alloc] init];
        p.name = @"张三";
        p.age = 20;
        p.apple = @[@"iphone",@"ipad"];
        
        
        NSString *filePath3 = [NSHomeDirectory() stringByAppendingString:@"person.src"];
        BOOL suc = [NSKeyedArchiver archiveRootObject:p toFile:filePath3];
        if (suc) {
            NSLog(@" file3 archive success");
        }
        
        
        Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath3];
        NSLog(@" person is %@", person);
        
        
        
        
        
        
        
        
    }
    return 0;
}

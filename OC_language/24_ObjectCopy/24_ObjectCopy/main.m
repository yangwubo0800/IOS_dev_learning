//
//  main.m
//  24_ObjectCopy
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //对象具备拷贝功能，必须实现如下协议
        //<NSCopying>、<NSMutableCopying>
        
        //copy方法返回的是一个不可变对象，mutableCopy方法返回的是一个可变对象
        
        /*
         NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"one",@"two",nil];
         NSMutableArray *array2 = [array1 retain];
         //retain只是引用计数+1，没有创建新的对象
         //array1与array2指针相同，指向同一个对象
         if(array1 == array2){
         NSLog(@"array1 == array2");
         NSLog(@"array1的引用计数:%ld",array1.retainCount);
         }
         */
        
//        NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"one",@"two",nil];
//        //复制对象，创建一个新的副本对象
//        //这里使用copy方法复制，返回的是一个不可变数组，但是用一个可变数组来声明，但是我们关心的是指针的的内容，而不是类型
//        //所以array2的真实类型还是不可变类型的
//        NSMutableArray *array2 = [array1 copy];//array2计数为:1,因为是新创建出来的对象
//
//        //使用mutableCopy方法，返回的就是可变数组
//        //当然这种方法只针对于那些有可变对象之分有用，对于其他的对象这个方法和copy方法的效果是一样的
//        NSMutableArray *array3 = [array1 mutableCopy];
//
//        if(array1 != array2){
//            NSLog(@"array1 != array2");
//            NSLog(@"array1的引用计数:%ld",array1.retainCount);
//            NSLog(@"array2的引用计数:%ld",array2.retainCount);
//        }
//        [array2 release];
//        [array1 release];
        
        
        NSMutableArray *array1 = [NSMutableArray arrayWithCapacity:2];
        for (int i=0; i<2; i++) {
            Person *p = [[Person alloc] init];
            [array1 addObject:p];
            [p release];
        }
        
        NSLog(@" array1 arc is %ld", [array1 retainCount]);
        
        //引用计数都是1
        for(Person *p in array1){
            NSLog(@"复制之前的引用计数:%ld",p.retainCount);
            NSLog(@"复制之前的指针:%p",p);
        }
        
        
        //引用计数都是2，因为是浅拷贝，又有指针指向对象了，array2也是使用了person
        //浅拷贝：只拷贝对象指针
        //深拷贝：复制属性
        NSArray *array2 = [array1 copy];
        for(Person *p in array2){
            NSLog(@"复制之后的引用计数:%ld",p.retainCount);
            NSLog(@"复制之后的指针:%p",p);
        }
        
        //content copy
        Person *p = [[Person alloc] init];
        p.apples = [NSMutableArray arrayWithObjects:@"apple", @"orange", nil];
        p.age = 20;
        
        NSLog(@" start copy p person");
        Person *p1 = [p copy];
        if (p != p1) {
            NSLog(@" p != p1");
            NSLog(@"p1 apple is %@", p1.apples);
            NSLog(@"p1 apple retain count is %ld", [p1.apples retainCount]);
            NSLog(@"p1 retain count is %ld", [p1 retainCount]);
        }
        
     
    }
    return 0;
}

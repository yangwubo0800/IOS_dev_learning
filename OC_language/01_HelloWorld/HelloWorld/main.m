//
//  main.m
//  HelloWorld
//
//  Created by yangwubo on 19/4/12.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSInteger s = 10;
        
        NSLog(@"the s value is %ld\n", s);
        
        //对象方法：[对象变量  方法名 参数]
        //类方法：[类名  方法名 参数]
//        Person *person = [[Person alloc] init];
//        
//        [person setName:@"yangpujun"];
//        [person shopping:89.9];
//        
//        NSString *personName = [person name];
//        NSLog(@" person name is %@", personName);
//        
//        
//        Person *person1 = [Person alloc];
//        person1 = [person1 init];
//        
//        [person1 setName:@"zhangsan" setAge:66];
//        
//        NSString *person1Name = [person1 name];
//        NSInteger person1Age = [person1 age];
//        
//        NSLog(@"person1 name is %@, person1 age is %ld", person1Name, (long)person1Age);
//        
//        Person *person3 = nil;
//        [person3 setName:@"empty object"];
        
        
//        Person *person4 = [[Person alloc] initWithName:@"lisi" withAge:25];
//        [person4 showInfo];
//        
//        Person *person5 = [[Person alloc] init];
//        [person5 showInfo];
//        
//        id person6 = [[Person alloc] initWithName:@"wangwu" withAge:22];
//        [person6 showInfo];
        
        Person *person7 = [[Person alloc] init];
        person7.name = @"zhaoliu";
        person7.age = 33;
        
        [person7 showInfo];
        
        
        //get test
        NSString *name = person7.name;
        NSInteger age = person7.age;
        
        NSLog(@" get name is %@, age is %ld", name, age);
        
        NSString *testName = person7.showInfo;
        NSLog(@" show info test name is %@", testName);
        
        
//        [person7 test];
        
        
        
        
    }
    return 0;
}

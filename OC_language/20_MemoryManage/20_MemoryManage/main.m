//
//  main.m
//  20_MemoryManage
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    
        // insert code here...
        NSLog(@"Hello, World!");
        
        Dog *dog = [[Dog alloc] init];
        [dog setName:@"小黑"];
        
        Dog *dog1 = [[Dog alloc] init];//引用计数为1
        [dog setName:@"大黄"];
        
        Person *p1 = [[Person alloc] init];
        [p1 setName:@"张三"];
        [p1 setDog:dog];
        [p1 setDog:dog1];//狗的引用替换成了大黄
        
        Person *p2 = [[Person alloc] init];
        [p2 setName:@"李四"];
        [p2 setDog:dog];
        
        //这里引用计数为1，这个和我们之前说的引用计数管理有矛盾，所以我们在使用的时候需要手动的retain
        NSLog(@"引用计数为:%ld",[dog retainCount]);
    
        

        [dog1 release];//因为alloc的时候引用计数就为1了
    
    
        //这里就有一个问题了，dog1对象已经被销毁了，但是setDog对象还是用了dog1对象调用方法了，这就会报错了
        //所以又对set方法进行改进了
        [p1 setDog:dog1];
    
    
        //当人销毁的时候，还需要对狗的引用-1
        //在人的dealloc方法中实现
    //debug
     //[dog1 release];
     NSLog(@"1 dog1  引用计数为:%ld",[dog1 retainCount]);
        Person *p3 = [[Person alloc] initWithDog:dog1];
   
        [dog1 release];//dog1的引用计数：0
    NSLog(@"2 dog1  引用计数为:%ld",[dog1 retainCount]);
        [p3 playDog];
    
        [p3 release];
    //NSLog(@"3 dog1引用计数为:%ld",[dog1 retainCount]);
   
    
    return 0;
}

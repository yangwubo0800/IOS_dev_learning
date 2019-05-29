//
//  main.m
//  22_AutoReleasePool
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "User.h"

int main(int argc, const char * argv[]) {
    
//    Dog *dog1 = [[Dog alloc] init];
//    Dog *dog2 = [[Dog alloc] init];
//
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//
//    //数组会对每一个元素retain
//    [array addObject:dog1]; //dog1计数=2
//    [array addObject:dog2]; //dog2计数=2
//
//    NSLog(@"1 dog ARC is %ld", [dog1 retainCount]);
//
//    [dog1 release];
//    [dog2 release];
//
//    NSLog(@"2 dog ARC is %ld", [dog1 retainCount]);
//    NSLog(@"2 array ARC is %ld", [array retainCount]);
//
//    //当数组销毁的时候，会将所有的元素release
//    [array release];//数组销毁
//
//    //NSLog(@"3 dog ARC is %ld", [dog1 retainCount]);
//
//    //当数组移除所有的元素的时候，会讲所有的元素release
//    [array removeAllObjects];
    
    
    /*
     //创建一个自动释放池
     //有作用域的问题，在{}中定义的东西外部是不能访问的，这点和NSAutoreleasePool有区别的
     @autoreleasepool {//等价于[[NSAutoreleasePool alloc] init]
     
     Dog *dog2 = [[Dog alloc] init];
     [dog2 retain];
     
     }//等价于[pool release]
     
     //创建一个自动释放池
     NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
     
     Dog *dog1 = [[Dog alloc] init];//计数：1
     
     //将dog1对象加入到自动释放池中，却别于之前的release方法
     //加入到自动释放池中之后，不是代表我们不需要管理引用了，只是自动释放池自动会调用一次release
     //当自动释放池销毁的时候，释放池会对池中每一个对象调用一次release
     [dog1 autorelease];
     NSLog(@"dog1计数:%ld",dog1.retainCount);
     
     //销毁自动释放池
     //这时候会调用dog1的release方法，dog1对象就被销毁了
     [pool release];
     */
    
    //自动释放池的嵌套
    NSAutoreleasePool *pool1 = [[NSAutoreleasePool alloc] init];
    
    //添加我们的代码
    //dog1放到了pool1中
    Dog *dog1 = [[Dog alloc] init];
    NSLog(@"1 dog1 arc is %ld", [dog1 retainCount]);
    
    User *user = [[User alloc] init];
    
    [user setDog:dog1];
    NSLog(@"2 dog1 arc is %ld", [dog1 retainCount]);
    
    
    [dog1 autorelease];
    
    NSLog(@"3 dog1 arc is %ld", [dog1 retainCount]);
    //自动释放池的嵌套
    NSAutoreleasePool *pool2 = [[NSAutoreleasePool alloc] init];
    
    //dog2放到了pool2中
    Dog *dog2 = [[Dog alloc] init];
    [dog2 autorelease];
    
    //pool2销毁了
    [pool2 release];
    
    //pool1销毁了
    [pool1 release];
    
    
    //下面的代码就是有问题的
    //[person setDog:[[Dog alloc] init];
    //正确的写法
    //Dog *dogs = [[[Dog alloc] init] autorelease];
    
  
    return 0;
}

//
//  Person.m
//  20_MemoryManage
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initWithDog:(Dog*)dog{
    //使用初始化的时候传入dog
    self = [super init];
    if(self != nil){
        //因为初始化方法只会调用一次，所以这里就没有做判断了
        [_dog release];
        NSLog(@"1 person dog retain is %ld",[_dog retainCount]);
        _dog = [dog retain];
        NSLog(@"2 person dog retain is %ld",[_dog retainCount]);
    }
    return self;
}

- (void)setName:(NSString *)name{
    //这里name也是对象，所以也是需要进行改写
    _name = name;
    
    /*
     //这里的判断是因为setName方法可能会被多次调用
     if(_name != name){
     [_name release];
     [name copy];//这里使用了copy，而没有使用retain,这个是字符串独有的，其他对象类型都是使用retain的
     }
     */
}

//第一种方式
/*
 - (void)setDog:(Dog *)dog{
 //引用计数需要+1
 _dog = [dog retain];
 
 //有时候可能需要替换Dog对象，所以这里还要注意释放Dog的引用
 }
 */

//第二种方式
/*
 - (void)setDog:(Dog *)dog{
 //使用nil去调用方法是没有错误的
 //但是当一个对象被销毁的时候，指针就变成野指针了，这时候调用方法会出错的
 [_dog release];
 _dog = [dog retain];
 }
 */

//第三种方式
- (void)setDog:(Dog *)dog{
    //这里的判断是因为setName方法可能会被多次调用
    if(_dog != dog){
        [_dog release];
        _dog = [dog retain];
    }
}

- (void)playDog{
    NSLog(@"playDog");
}

- (Dog *)dog{
    return _dog;
}

- (void)dealloc{
    //对象类型的属性都需要在这里进行释放引用
    //对狗进行释放
    [_dog release];
    NSLog(@"dealloc is Executing");
    [super dealloc];
}


@end

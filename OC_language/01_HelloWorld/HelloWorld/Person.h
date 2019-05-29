//
//  Person.h
//  HelloWorld
//
//  Created by yangwubo on 19/4/17.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSString *_name;
    NSInteger _age;
}

//方法说明 (返回类型) 方法名 : (参数类型)参数名称
-(void)shopping:(float)price;

-(void)setName:(NSString*)name;

-(void)setAge:(NSInteger)age;

-(NSString*)name;

-(NSInteger)age;

-(void)setName:(NSString *)name setAge:(NSInteger)age;

//初始化
-(id)initWithName:(NSString *)name withAge:(NSInteger)age;

-(NSString *)showInfo;

-(void)test;


//类方法

+(Person*)newPerson;



@end

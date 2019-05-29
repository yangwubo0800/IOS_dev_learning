//
//  Car.h
//  ClassCharacter
//
//  Created by yangwubo on 19/4/22.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject{
    
    //这个属性就是对外进行保密的相当于private，所以我们需要在外部访问的话，必须定义get/set方法
    //默认的是private的，但是我们可以使用@public设置为public属性的,那么在外部可以直接访问：person->capcity = 2.8;
    //当然我们一般不这么使用，因为这会破坏封装性，这种用法相当于C中的结构体中权限
    //一共四种：@public,@protected,@private,@package,这个和Java中是相同的
    
    @public
    float _capacity;
    
    NSString *_brand;
    NSString *_color;
}

-(void)run:t;

-(void)setBrand:(NSString*) brand;

-(void)setColor:(NSString*) color;

-(void)brake;

-(void)quicken;

@end

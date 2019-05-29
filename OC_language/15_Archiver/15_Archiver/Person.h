//
//  Person.h
//  15_Archiver
//
//  Created by yangwubo on 19/4/30.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property(nonatomic, copy)NSString *name;

@property(nonatomic, assign)NSInteger age;

@property(nonatomic, retain)NSArray *apple;

-(NSString *)description;

@end

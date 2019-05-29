//
//  Person.h
//  19_Predicate
//
//  Created by yangwubo on 19/5/5.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;

@property NSInteger age;

+(id)personWithName: (NSString *)name andAge:(NSInteger) age;

@end

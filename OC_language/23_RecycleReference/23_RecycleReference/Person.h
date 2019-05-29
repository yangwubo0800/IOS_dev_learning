//
//  Person.h
//  23_RecycleReference
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(retain, nonatomic, readwrite)Dog *dog;

-(void)dealloc;

@end

NS_ASSUME_NONNULL_END

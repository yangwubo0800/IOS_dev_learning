//
//  Person.h
//  24_ObjectCopy
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject <NSCopying>

@property (nonatomic, retain) NSMutableArray *apples;

@property (nonatomic) int age;

@end

NS_ASSUME_NONNULL_END

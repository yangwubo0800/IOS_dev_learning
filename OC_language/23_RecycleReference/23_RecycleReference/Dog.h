//
//  Dog.h
//  23_RecycleReference
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject

@property(nonatomic, assign, readwrite) Person *person;

-(void)dealloc;

@end

NS_ASSUME_NONNULL_END

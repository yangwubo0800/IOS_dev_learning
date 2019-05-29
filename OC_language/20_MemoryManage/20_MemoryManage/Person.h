//
//  Person.h
//  20_MemoryManage
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject{
    Dog *_dog;
    NSString * _name;

}

- (id)initWithDog:(Dog*)dog;
- (void)setName:(NSString *)name;
- (void)setDog:(Dog *)dog;
- (void)playDog;
- (Dog *)dog;

- (void)dealloc;


@end

NS_ASSUME_NONNULL_END

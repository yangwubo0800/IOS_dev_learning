//
//  Dog.h
//  22_AutoReleasePool
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject{
    NSString *_name;
}

- (void) setName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

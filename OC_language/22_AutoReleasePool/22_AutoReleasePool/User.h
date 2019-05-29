//
//  User.h
//  22_AutoReleasePool
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject{
    
}

@property (retain, atomic) Dog *dog;

@end



NS_ASSUME_NONNULL_END

//
//  Person.h
//  17_KVC&KVO
//
//  Created by yangwubo on 19/5/4.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject{
    
    @private
    NSString *_name;
    Dog *_dog;
    NSInteger _age;
}


@end

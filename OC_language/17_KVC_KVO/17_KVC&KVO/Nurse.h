//
//  Nurse.h
//  17_KVC&KVO
//
//  Created by yangwubo on 19/5/5.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Children;

@interface Nurse : NSObject{
    Children *_children;
}


-(id)initWithChildren:(Children*)chilren;

@end

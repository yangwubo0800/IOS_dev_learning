//
//  Dog.m
//  23_RecycleReference
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(void)dealloc{
    NSLog(@" dog dealloc");
    [super dealloc];
}

@end

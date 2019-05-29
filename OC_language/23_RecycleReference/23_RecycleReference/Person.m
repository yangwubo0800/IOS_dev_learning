//
//  Person.m
//  23_RecycleReference
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)dealloc{

    NSLog(@"Person dealloc");
    [super dealloc];
    [_dog release];
}

@end

//
//  Nanny.m
//  09_Delegate
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Nanny.h"
#import "Children.h"

@implementation Nanny

-(void)wash:(Children *)children{
    NSLog(@" Nanny wash");
}

-(void)play:(Children *)chilren{
    NSLog(@" Nanny play");
}

@end

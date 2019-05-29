//
//  Student.m
//  08_protocolDemo
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Student.h"

@implementation Student

-(void)study{
    NSLog(@" student study");
}

#pragma mark - WithProtocol

-(void)finishTask{
    NSLog(@" student finish task");
}

-(void)dontLate{
#warning work it later
    NSLog(@" student dont late");
}

//-(void)wearNeat{
//    NSLog(@" student wear neat");
//}



@end

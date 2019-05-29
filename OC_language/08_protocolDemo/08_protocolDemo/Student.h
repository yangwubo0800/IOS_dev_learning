//
//  Student.h
//  08_protocolDemo
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WithProtocol.h"

@interface Student : NSObject <WithProtocol>

-(void)study;

@end

//
//  WithProtocol.h
//  08_protocolDemo
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WithProtocol <NSObject>

@required
-(void)finishTask;


-(void)dontLate;


@optional

-(void)wearNeat;

@end

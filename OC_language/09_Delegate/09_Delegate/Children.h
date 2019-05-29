//
//  Children.h
//  09_Delegate
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Children;

@protocol ChilrenDelegate <NSObject>

@required
-(void)wash:(Children *)children;

-(void)play:(Children *)chilren;

@end

@interface Children : NSObject{
    id<ChilrenDelegate> _delegate;
    NSInteger timeVaule;
}


-(void)setDelegate:(id)delegate;

@end

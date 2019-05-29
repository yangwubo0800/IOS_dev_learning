//
//  Nanny.h
//  09_Delegate
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Children.h"

@interface Nanny : NSObject<ChilrenDelegate>


-(void)wash:(Children *)children;

-(void)play:(Children *)chilren;

@end

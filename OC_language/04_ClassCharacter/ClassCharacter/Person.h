//
//  Person.h
//  ClassCharacter
//
//  Created by yangwubo on 19/4/22.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColorPrinter.h"
#import "BlackPrinter.h"

@interface Person : NSObject{
    NSString *_name;
}

-(void)doPrint:(Printer *)printer;


@end

//
//  NSString+Extension.m
//  06_classTarget
//
//  Created by yangwubo on 19/4/23.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

-(BOOL)validateEmail{
    NSRange range = [self rangeOfString:@"@"];
    if (range.location == NSNotFound) {
        return NO;
    }else{
        return YES;
    }
}


-(NSInteger)intValue{
    NSLog(@" intValue executed");
    return 0;
}

@end

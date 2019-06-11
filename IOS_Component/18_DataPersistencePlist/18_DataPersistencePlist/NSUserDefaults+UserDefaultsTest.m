//
//  NSUserDefaults+UserDefaultsTest.m
//  18_DataPersistencePlist
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "NSUserDefaults+UserDefaultsTest.h"

static NSString *const phoneNumberkey = @"phoneNumberKey";

@implementation NSUserDefaults (UserDefaultsTest)

#pragma mark
+(void)savePhoneNumber:(NSString *)number{
    [[NSUserDefaults standardUserDefaults] setObject:number forKey:phoneNumberkey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *) getPhoneNumber{
    return [[NSUserDefaults standardUserDefaults] objectForKey:phoneNumberkey];
    
}

@end

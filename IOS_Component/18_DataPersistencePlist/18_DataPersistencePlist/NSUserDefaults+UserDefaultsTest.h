//
//  NSUserDefaults+UserDefaultsTest.h
//  18_DataPersistencePlist
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (UserDefaultsTest)

+(void)savePhoneNumber:(NSString *)number;

+(NSString *) getPhoneNumber;

@end

NS_ASSUME_NONNULL_END

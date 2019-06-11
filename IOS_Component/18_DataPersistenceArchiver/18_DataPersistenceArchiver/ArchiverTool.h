//
//  ArchiverTool.h
//  18_DataPersistenceArchiver
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArchiverTool : NSObject

+(BOOL)archiveObject:(id)object prefix:(NSString *)prefix;


+(id)unarchiveObject:(Class)class prefix:(NSString *)prefix;


+(NSString *)getPathWithPrefix:(NSString *)prefix;


@end

NS_ASSUME_NONNULL_END

//
//  SandBoxTool.h
//  18_DataPersistenceArchiver
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SandBoxTool : NSObject

+(void)toolToSaveMusicToCache:(NSString *)musicUrl withMusicName:(NSString *)name;


+(NSString *)toolGetMusicFromCache:(NSString *)name;

+(NSString *)getPathWithMusicName:(NSString *) name;

@end

NS_ASSUME_NONNULL_END

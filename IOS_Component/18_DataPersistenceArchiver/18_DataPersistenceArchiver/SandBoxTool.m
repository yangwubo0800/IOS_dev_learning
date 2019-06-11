//
//  SandBoxTool.m
//  18_DataPersistenceArchiver
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "SandBoxTool.h"

@implementation SandBoxTool




+(NSString *) getPathWithMusicName:(NSString *)name{
    NSString *musicPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePathFolder = [musicPath stringByAppendingPathComponent:@"music"];
    NSLog(@" get path folder is %@", filePathFolder);
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePathFolder]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePathFolder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *path = [NSString stringWithFormat:@"%@/%@.mp3", filePathFolder, name];
    return path;
}


+(NSString*) toolGetMusicFromCache:(NSString *)name{
    NSString *musicPath = [self getPathWithMusicName:name];
    if ([[NSFileManager defaultManager] fileExistsAtPath:musicPath]) {
        return musicPath;
    }
    return nil;
}


+(void)toolToSaveMusicToCache:(NSString *)musicUrl withMusicName:(NSString *)name{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_queue_create("musicQueue", DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        //已经存了
        if ([weakSelf alreadySaveMusic:name]){
            return ;
        }
        NSLog(@" music url is %@", musicUrl);
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:musicUrl]];
        
        NSError *error;
        
        NSData *data = [NSData dataWithContentsOfFile:musicUrl];
        
        [data writeToFile:[weakSelf getPathWithMusicName:name] atomically:YES];
    });
}


+ (BOOL)alreadySaveMusic:(NSString *)musicName {
    NSString *musicPath = [self getPathWithMusicName:musicName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:musicPath]) {
        return NO;
    } else {
        NSData *data = [NSData dataWithContentsOfFile:musicPath];
        if (data.length > 0) {
            return YES;
        }
        return NO;
    }
}


@end

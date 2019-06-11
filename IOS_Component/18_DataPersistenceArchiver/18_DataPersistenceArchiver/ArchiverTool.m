//
//  ArchiverTool.m
//  18_DataPersistenceArchiver
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ArchiverTool.h"

@implementation ArchiverTool

+(BOOL)archiveObject:(id)object prefix:(NSString *)prefix{
    if (!object) {
        return NO;
    }
    NSError *error;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object requiringSecureCoding:YES error:&error];
    if (error) {
        return NO;
    }
    
    [data writeToFile:[self getPathWithPrefix:prefix] atomically:YES];
    return YES;
}


+(id)unarchiveObject:(Class)class prefix:(NSString *)prefix{
    NSError *error;
    NSData *data = [[NSData alloc] initWithContentsOfFile:[self getPathWithPrefix:prefix]];
    
    id content = [NSKeyedUnarchiver unarchivedObjectOfClass:class fromData:data error:&error];
    
    if (error) {
        return nil;
    }
    
    return content;
}




+(NSString *)getPathWithPrefix:(NSString *)prefix{
    //document path
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    //file folder path
    NSString *fileFolderPath = [documentPath stringsByAppendingPaths:@[@"archiveTemp"]].firstObject;
    
    //create folder first time
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileFolderPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:fileFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    //fomat file path and return
    NSString *path = [NSString stringWithFormat:@"%@/%@.archive", fileFolderPath, prefix];
    NSLog(@" get path with prefix path is %@", path);
    
    return  path;
}



@end

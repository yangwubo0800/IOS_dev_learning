//
//  HJFMDBManager.m
//  18_DataPersistenceFMDB
//
//  Created by hongbo ni on 2019/5/28.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "HJFMDBManager.h"
#import "fmdb/FMDatabase.h"
#import "fmdb/FMDatabaseQueue.h"

@interface HJFMDBManager ()

@property (nonatomic, strong) FMDatabase *db;
@property (nonatomic, strong) FMDatabaseQueue *dbQueue;

@end



@implementation HJFMDBManager

#pragma mark 创建manager
+ (instancetype)sharedInstance {
    NSLog(@"=====sharedInstance");
    static HJFMDBManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HJFMDBManager alloc] init];
    });
    return manager;
}

#pragma mark - 打开数据库
+ (BOOL)openDBForQueue {
    //获取路径
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    //FMDB文件夹
    NSString *fmdbFolder = [documentPath stringByAppendingPathComponent:@"FMDB"];
    //判断文件夹是否存在
    if (![[NSFileManager defaultManager] fileExistsAtPath:fmdbFolder]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:fmdbFolder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    //数据库路径
    NSString *dbPath = [fmdbFolder stringByAppendingPathComponent:@"fmdb.db"];
    NSLog(@"=====openDBForQueue dbPath=%@", dbPath);
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if ([db open]) {
        [HJFMDBManager sharedInstance].db = db;
        [HJFMDBManager sharedInstance].dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
        return YES;
    }
    return NO;
}

#pragma mark - 关闭数据库
+ (void)closeDBForQueue {
    [[[HJFMDBManager sharedInstance] dbQueue] close];
}

#pragma mark - 删除数据库
+ (BOOL)deleteFMDB {
    NSString *documentStr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fmdbFolder = [documentStr stringByAppendingPathComponent:@"FMDB"];
    NSError *error;
    if ([[NSFileManager defaultManager] fileExistsAtPath:fmdbFolder]) {
        [[NSFileManager defaultManager] removeItemAtPath:fmdbFolder error:&error];
    }
    if (error) {
        return NO;
    }
    return YES;
}

#pragma mark - 执行增删改建表
+ (BOOL)executeWithSql:(NSString *)sql {
    return [[HJFMDBManager sharedInstance].db executeUpdate:sql];
}

#pragma mark - 异步，执行增删改建表
+ (void)executeAsynWithSql:(NSString *)sql
                 isSuccess:(void(^)(BOOL isSuccess))successBlock {
    [[[HJFMDBManager sharedInstance] dbQueue] inDatabase:^(FMDatabase * _Nonnull db) {
        BOOL isSuccess = [db executeUpdate:sql];
        if (successBlock) {
            successBlock(isSuccess);
        }
    }];
}

#pragma mark - 执行查询数据
+ (NSArray *)executeQueryWithSql:(NSString *)sql {
    FMResultSet *resultSet = [[HJFMDBManager sharedInstance].db executeQuery:sql];
    NSMutableArray *array = [NSMutableArray array];
    while (resultSet.next) {
        [array addObject:resultSet.resultDictionary];
    }
    return array;
}

#pragma mark - 异步，执行查询数据
+ (void)executeAsynQueryWithSql:(NSString *)sql
                      isSuccess:(void(^)(NSArray *resultArray))successBlock {
    [[[HJFMDBManager sharedInstance] dbQueue] inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *resultSet = [db executeQuery:sql];
        NSMutableArray *array = [NSMutableArray array];
        while (resultSet.next) {
            [array addObject:resultSet.resultDictionary];
        }
        if (successBlock) {
            successBlock(array);
        }
    }];
}


@end

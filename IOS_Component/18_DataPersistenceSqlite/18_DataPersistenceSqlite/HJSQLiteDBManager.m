//
//  HJSQLiteDBManager.m
//  18_DataPersistenceSqlite
//
//  Created by hongbo ni on 2019/5/28.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "HJSQLiteDBManager.h"
#import <sqlite3.h>

@interface HJSQLiteDBManager ()

@property (nonatomic, assign) sqlite3 *db;

@end

@implementation HJSQLiteDBManager

#pragma mark - 创建对象
+ (instancetype)sharedInstance {
    NSLog(@" ====sharedInstance");
    static HJSQLiteDBManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HJSQLiteDBManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    NSLog(@" ====init");
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - 打开数据库
+ (void)openDB {
    NSLog(@" ====openDB");
    sqlite3 *sql = [HJSQLiteDBManager sharedInstance].db;
    sqlite3_open([[HJSQLiteDBManager getDBpath] UTF8String], &sql);
    [HJSQLiteDBManager sharedInstance].db = sql;
}

+ (NSString *)getDBpath {
    NSString *documentStr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *sqlDBFolder = [documentStr stringByAppendingPathComponent:@"SQLiteDB"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:sqlDBFolder]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:sqlDBFolder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
     NSLog(@" ====getDBpath sqlDBFolder=%@", sqlDBFolder);
    return [sqlDBFolder stringByAppendingPathComponent:@"dataDemo.sqlite"];
}

#pragma mark - 关闭数据库
+ (void)closeDB {
    sqlite3_close([HJSQLiteDBManager sharedInstance].db);
}

#pragma mark - 删除数据库
+ (BOOL)deleteSQliteDB {
    NSString *documentStr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *sqlDBFolder = [documentStr stringByAppendingPathComponent:@"SQLiteDB"];
    NSError *error;
    if ([[NSFileManager defaultManager] fileExistsAtPath:sqlDBFolder]) {
        [[NSFileManager defaultManager] removeItemAtPath:sqlDBFolder error:&error];
    }
    if (error) {
        return NO;
    }
    return YES;
}

#pragma mark - 创建表
+ (BOOL)createTableWithSql:(NSString *)sql {
    sqlite3 *sqlite = [[HJSQLiteDBManager sharedInstance] db];
    char *errorMsg = "";
    if (sqlite3_exec(sqlite, [sql UTF8String], nil, nil, &errorMsg) == SQLITE_OK) {
        return YES;
    } else {
        NSLog(@"创建表失败");
        return NO;
    }
}

#pragma mark - 查询
+ (NSArray *)selectRecordWithSql:(NSString *)sql {
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2([HJSQLiteDBManager sharedInstance].db, [sql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        NSMutableArray *array = [NSMutableArray array];
        //执行sql语句
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            //获取列数
            int columnCount = sqlite3_column_count(stmt);
            //获取每一列的值与列明放入字典数组中
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            for (int i = 0; i < columnCount; i++) {
                //获取值
                char *value = (char *)sqlite3_column_text(stmt, i);
                NSString *valueStr;
                if (value != NULL) {
                    valueStr = [NSString stringWithUTF8String:value];
                }
                //获取key
                char *key = (char *)sqlite3_column_name(stmt, i);
                NSString *keyStr = [NSString stringWithUTF8String:key];
                dict[keyStr] = valueStr;
            }
            [array addObject:dict];
        }
        sqlite3_finalize(stmt);
        return array;
    }
    return @[];
}


/**
 增删改操作记录
 
 @param sql sql语句
 @return BOOL
 */
+ (BOOL)operationRecordWithSql:(NSString *)sql {
    //对sql执行预编译
    sqlite3_stmt *stmt;
    //sqlite3_prepare_v2是执行查询的方法
    if (sqlite3_prepare_v2([HJSQLiteDBManager sharedInstance].db, [sql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        //执行sql语句
        if (sqlite3_step(stmt) == SQLITE_DONE) {
            sqlite3_finalize(stmt);
            return YES;
        }
    }
    return NO;
}

@end

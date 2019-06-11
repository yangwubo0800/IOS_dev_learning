//
//  HJSQLiteDBManager.h
//  18_DataPersistenceSqlite
//
//  Created by hongbo ni on 2019/5/28.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJSQLiteDBManager : NSObject
/**
 单利创建Manager
 
 @return return value description
 */
+ (instancetype)sharedInstance;

/**
 打开数据库
 */
+ (void)openDB;

/**
 关闭数据库
 */
+ (void)closeDB;

/**
 删除数据库
 
 @return BOOL
 */
+ (BOOL)deleteSQliteDB;

/**
 创建表
 
 @param sql sql语句
 @return BOOL
 */
+ (BOOL)createTableWithSql:(NSString *)sql;

/**
 增删改操作
 
 @param sql sql语句
 @return BOOL
 */
+ (BOOL)operationRecordWithSql:(NSString *)sql;

/**
 查询记录
 
 @param sql sql语句
 @return NSArray
 */
+ (NSArray *)selectRecordWithSql:(NSString *)sql;
@end

NS_ASSUME_NONNULL_END

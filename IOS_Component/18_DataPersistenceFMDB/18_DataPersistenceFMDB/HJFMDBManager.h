//
//  HJFMDBManager.h
//  18_DataPersistenceFMDB
//
//  Created by hongbo ni on 2019/5/28.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJFMDBManager : NSObject

/**
 单利manager
 
 @return return value description
 */
+ (instancetype)sharedInstance;

/**
 打开数据库
 
 @return BOOL
 */
+ (BOOL)openDBForQueue;

/**
 关闭数据库
 */
+ (void)closeDBForQueue;



/**
 删除数据库
 
 @return BOOL
 */
+ (BOOL)deleteFMDB;


/**
 执行增删改建表
 
 @param sql sql语句
 */
+ (BOOL)executeWithSql:(NSString *)sql;

/**
 异步，执行增删改建表
 
 @param sql sql语句
 @param successBlock block
 */
+ (void)executeAsynWithSql:(NSString *)sql
                 isSuccess:(void(^)(BOOL isSuccess))successBlock;

/**
 执行查询数据
 
 @param sql sql语句
 */
+ (NSArray *)executeQueryWithSql:(NSString *)sql;

/**
 异步，执行查询数据
 
 @param sql sql语句
 @param successBlock block
 */
+ (void)executeAsynQueryWithSql:(NSString *)sql
                      isSuccess:(void(^)(NSArray *resultArray))successBlock;


@end

NS_ASSUME_NONNULL_END

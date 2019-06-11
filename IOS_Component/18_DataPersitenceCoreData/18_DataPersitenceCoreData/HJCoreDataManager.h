//
//  HJCoreDataManager.h
//  18_DataPersitenceCoreData
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJCoreDataManager : NSObject

/**
 单利创建
 
 @return HJCoreDataManager
 */
+ (instancetype)sharedInstanceManager;

/**
 删除数据库
 */
+ (void)managerForDelete;



//================================ 添加数据 ================================//

/**
 获取数据模型
 
 @param entityName 数据模型类名称
 @return return value description
 */
+ (NSManagedObject *)getTableWithEntityName:(NSString * _Nonnull)entityName;

/**
 保存数据
 */
+ (BOOL)save;

//================================       ================================//

/**
 删除数据
 
 @param entityName   数据模型类名称
 @param searchString 属性名的值包含的字符
 @param attribute    属性名称
 @return             成功失败
 */
+ (BOOL)deleteByEntityName:(NSString * _Nonnull)entityName
               withMaching:(NSString * _Nonnull)searchString
             withAttribute:(NSString * _Nonnull)attribute;

/**
 更新数据
 
 @param managedObject pojo对象
 @return bool
 */
+ (BOOL)updateManagedObject:(NSManagedObject *)managedObject;

/**
 查询数据
 
 @param entityName   数据模型类名称
 @param searchString 属性名的值包含的字符
 @param attribute    属性名称
 @param sortArribute 按哪个属性名称排序
 @param ascending    是否升序
 @return             模型数组
 */
+ (NSArray *)selectByEntityName:(NSString * _Nonnull)entityName
                    withMaching:(NSString * _Nullable)searchString
                  withAttribute:(NSString * _Nullable)attribute
                      sortingBy:(NSString * _Nullable)sortArribute
                    isAscending:(BOOL)ascending;



@end

NS_ASSUME_NONNULL_END

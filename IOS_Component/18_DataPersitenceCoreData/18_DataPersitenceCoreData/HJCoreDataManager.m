//
//  HJCoreDataManager.m
//  18_DataPersitenceCoreData
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "HJCoreDataManager.h"

#define HJStrIsEmpty(str) ((str == nil) || ([str isEqualToString: @""]) || (str == NULL) ||     ([str isKindOfClass:[NSNull class]]))


@interface HJCoreDataManager ()


/**
 数据模型
 */
@property (nonatomic, strong) NSManagedObjectModel *objectModel;


/**
 持久化数据
 */
@property (nonatomic, strong) NSPersistentStoreCoordinator *coordinator;

/**
 管理数据的对象
 */
@property (nonatomic, strong) NSManagedObjectContext *objectContext;


@end


@implementation HJCoreDataManager

#pragma mark - 单利创建
+ (instancetype)sharedInstanceManager {
    static HJCoreDataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HJCoreDataManager alloc] init];
        NSLog(@"dispatch once run");
    });
    
    NSLog(@"dispatch once %p", manager);
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        //创建托管对象模型
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"HJCoreData" withExtension:@"momd"];
        
        NSLog(@" init url is %@", [url description]);
        
        _objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:url];
        //创建持久化数据协调器
        _coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_objectModel];
        //关联并创建本地数据库文件
        [_coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[self dbPath] options:nil error:nil];
        //创建托管对象上下文
        _objectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:(NSMainQueueConcurrencyType)];
        [_objectContext setPersistentStoreCoordinator:_coordinator];
    }
    return self;
}


/**
 获取数据库路径
 
 @return return value description
 */
- (NSURL *)dbPath {
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    
    NSString *dbFolder = [documentPath stringByAppendingPathComponent:@"CoreData"];
    
    NSLog(@" init dbFolder is %@", dbFolder);
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dbFolder]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:dbFolder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSURL *dbUrl = [[NSURL fileURLWithPath:dbFolder] URLByAppendingPathComponent:@"db.sqlite"];
    
    NSLog(@" init dbUrl is %@", dbUrl);
    
    return dbUrl;
}

#pragma mark - 删除数据库
+ (void)managerForDelete {
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"CoreData"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
}



#pragma mark - 获取数据模型
+ (NSManagedObject *)getTableWithEntityName:(NSString *)entityName {
    
    NSLog(@" getTableWithEntityName entityName:%@", entityName);
    
    NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:[HJCoreDataManager sharedInstanceManager].objectContext];
    
    return managedObject;
}

#pragma mark - 保存数据
+ (BOOL)save {
    
    NSError *error;
    BOOL success = [[HJCoreDataManager sharedInstanceManager].objectContext save:&error];
    
    NSLog(@" save result:%d", success);
    
    return success;
}

#pragma mark - 删除数据
+ (BOOL)deleteByEntityName:(NSString * _Nonnull)entityName
               withMaching:(NSString * _Nonnull)searchString
             withAttribute:(NSString * _Nonnull)attribute {
    //没有输入删除条件
    if (HJStrIsEmpty(attribute) || HJStrIsEmpty(searchString)) {
        return YES;
    }
    //查询数据
    NSArray *array = [self selectByEntityName:entityName
                                  withMaching:searchString
                                withAttribute:attribute
                                    sortingBy:attribute
                                  isAscending:YES];
    if (array.count > 0) {
        //删除
        for (NSManagedObject *object in array) {
            [[HJCoreDataManager sharedInstanceManager].objectContext deleteObject:object];
        }
    }
    //执行保存操作
    return [HJCoreDataManager save];
}

#pragma mark - 更新数据
+ (BOOL)updateManagedObject:(NSManagedObject *)managedObject {
    [[HJCoreDataManager sharedInstanceManager].objectContext refreshObject:managedObject mergeChanges:YES];
    return [HJCoreDataManager save];
}

#pragma mark - 查询数据
+ (NSArray *)selectByEntityName:(NSString * _Nonnull)entityName
                    withMaching:(NSString * _Nullable)searchString
                  withAttribute:(NSString * _Nullable)attribute
                      sortingBy:(NSString * _Nullable)sortArribute
                    isAscending:(BOOL)ascending{
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:[HJCoreDataManager sharedInstanceManager].objectContext];
    //创建fetch请求
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = entity;
    //一次性获取完
    [fetchRequest setFetchBatchSize:0];
    if (!HJStrIsEmpty(sortArribute)) {
        //排序
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortArribute ascending:ascending selector:nil];
        NSArray *descriptors = @[sortDescriptor];
        fetchRequest.sortDescriptors = descriptors;
    } else {
        fetchRequest.sortDescriptors = @[];
    }
    
    if (!HJStrIsEmpty(searchString) && !HJStrIsEmpty(attribute)) {
        //某个属性的值包含某个字符串
        //%K 某个属性的值
        //%@ 传递过来的字符串
        //模糊查询 contains[cd] 包含某个值 c标识忽略大小写，d标识忽略重音
        //查询 ==
        fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@",attribute, searchString];
    }
    NSError *error;
    NSFetchedResultsController *fetchedController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[HJCoreDataManager sharedInstanceManager].objectContext sectionNameKeyPath:nil cacheName:nil];
    //执行获取操作
    if ([fetchedController performFetch:&error]) {
        //获取数据
        return [fetchedController fetchedObjects];
    } else {
        return @[];
    }
}


@end

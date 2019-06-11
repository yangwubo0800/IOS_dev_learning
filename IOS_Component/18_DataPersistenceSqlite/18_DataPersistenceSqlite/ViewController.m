//
//  ViewController.m
//  18_DataPersistenceSqlite
//
//  Created by hongbo ni on 2019/5/28.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"
#import "HJSQLiteDBManager.h"
#import "HJPersonModel+CoreDataClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [button setTitle:@"sqlite" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(sqlDeleteInfoButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
}



#pragma mark - SQLite3数据操作


/**
 添加数据
 
 @param sender sender description
 */
- (IBAction)sqlAddInfoButtonDidClicked:(UIButton *)sender {
    NSString *sqlStr = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(userId INT PRIMARY KEY NOT NULL, name CHAR(20) NOT NULL, age INT)",NSStringFromClass([HJPersonModel class])];
    [HJSQLiteDBManager createTableWithSql:sqlStr];
    NSString *insetSql = [NSString stringWithFormat:@"INSERT INTO %@ (userId, name) VALUES (2, '小金人')", NSStringFromClass([HJPersonModel class])];
    [HJSQLiteDBManager operationRecordWithSql:insetSql];
}
/**
 删除数据
 
 @param sender sender description
 */
- (IBAction)sqlDeleteInfoButtonDidClicked:(UIButton *)sender {
    NSString *deleteSql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE userId = 2", NSStringFromClass([HJPersonModel class])];
    [HJSQLiteDBManager operationRecordWithSql:deleteSql];
}
/**
 修改数据
 
 @param sender sender description
 */
- (IBAction)sqlUpdateInfoButtonDidClicked:(UIButton *)sender {
    NSString *updateSql = [NSString stringWithFormat:@"UPDATE %@ SET NAME = '小可爱', AGE = 90 WHERE userId = 2", NSStringFromClass([HJPersonModel class])];
    [HJSQLiteDBManager operationRecordWithSql:updateSql];
}
/**
 查询数据
 
 @param sender sender description
 */
- (IBAction)sqlSelectInfoButtonDidClicked:(UIButton *)sender {
    NSString *selectSql = [NSString stringWithFormat:@"SELECT * FROM %@", NSStringFromClass([HJPersonModel class])];
    NSArray *array = [HJSQLiteDBManager selectRecordWithSql:selectSql];
    NSLog(@"%@",array);
}

@end

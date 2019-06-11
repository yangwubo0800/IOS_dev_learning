//
//  ViewController.m
//  18_DataPersistenceFMDB
//
//  Created by hongbo ni on 2019/5/28.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"
#import "HJFMDBManager.h"
#import "../HJPersonModel+CoreDataClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [button setTitle:@"fmdb" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(fmdbUpdateButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
}



#pragma mark - FMDB数据库操作

/**
 增加记录
 
 @param sender sender description
 */
- (IBAction)fmdbInsertButtonDidClicked:(UIButton *)sender {
    NSString *creatStr =[NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(userId INT PRIMARY KEY NOT NULL, name CHAR(20) NOT NULL, age INT)", NSStringFromClass([HJPersonModel class])];
    [HJFMDBManager executeAsynWithSql:creatStr isSuccess:^(BOOL isSuccess) {
        if (isSuccess) {
            NSLog(@"创建表成功");
        }
    }];
    NSString *insertStr = [NSString stringWithFormat:@"INSERT INTO %@ VALUES (2, '小金人', 25)", NSStringFromClass([HJPersonModel class])];
    [HJFMDBManager executeAsynWithSql:insertStr isSuccess:^(BOOL isSuccess) {
        if (isSuccess) {
            NSLog(@"插入数据成功");
        }
    }];
}
/**
 删除记录
 
 @param sender sender description
 */
- (IBAction)fmdbDeleteButtonDidClicked:(UIButton *)sender {
    NSString *insertStr = [NSString stringWithFormat:@"DELETE FROM %@ WHERE USERID = 2", NSStringFromClass([HJPersonModel class])];
    [HJFMDBManager executeAsynWithSql:insertStr isSuccess:^(BOOL isSuccess) {
        if (isSuccess) {
            NSLog(@"删除数据成功");
        }
    }];
}
/**
 修改记录
 
 @param sender sender description
 */
- (IBAction)fmdbUpdateButtonDidClicked:(UIButton *)sender {
    NSString *insertStr = [NSString stringWithFormat:@"UPDATE %@ SET userid = 11, NAME = '小可爱', AGE = 90 WHERE userId = 2", NSStringFromClass([HJPersonModel class])];
    [HJFMDBManager executeAsynWithSql:insertStr isSuccess:^(BOOL isSuccess) {
        if (isSuccess) {
            NSLog(@"修改数据成功");
        }
    }];
}
/**
 查询记录
 
 @param sender sender description
 */
- (IBAction)fmdbSelectButtonDidClicked:(UIButton *)sender {
    NSString *selectSql = [NSString stringWithFormat:@"SELECT * FROM %@", NSStringFromClass([HJPersonModel class])];
    [HJFMDBManager executeAsynQueryWithSql:selectSql
                                 isSuccess:^(NSArray * _Nonnull resultArray) {
                                     NSLog(@"%@",resultArray);
                                 }];
}


@end

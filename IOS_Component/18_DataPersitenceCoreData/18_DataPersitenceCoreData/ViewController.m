//
//  ViewController.m
//  18_DataPersitenceCoreData
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"
#import "HJCoreDataManager.h"
#import "HJCarModel+CoreDataClass.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [button setTitle:@"coreData" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(coreDataSelectInfoButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}



#pragma mark - Core Data数据操作


/**
 增加数据
 
 @param sender sender description
 */
- (void)coreDataAddInfoButtonDidClicked:(UIButton *)sender {
    NSLog(@" coreDataAddInfoButtonDidClicked");
    HJCarModel *carModel = (HJCarModel *)[HJCoreDataManager getTableWithEntityName:NSStringFromClass([HJCarModel class])];
    
    carModel.carName = @"AE99";
    carModel.userName = @"一个大孩子";
    carModel.userId = 11;
    [HJCoreDataManager save];
}

/**
 删除数据
 
 @param sender sender description
 */
- (IBAction)coreDataDeleteInfoButtonDidClicked:(UIButton *)sender {
    BOOL isSuccess = [HJCoreDataManager deleteByEntityName:NSStringFromClass([HJCarModel class])
                                               withMaching:@"AE99"
                                             withAttribute:@"carName"];
    NSLog(@"%d",isSuccess);
}


/**
 修改数据
 
 @param sender sender description
 */
- (IBAction)coreDataUpdateInfoButtonDidClicked:(UIButton *)sender {
    //修改已经保存到数据库中的数据，在修改之前我们应该获取要修改的数据，修改之后对数据进行再次保存
    NSArray *array = [HJCoreDataManager selectByEntityName:NSStringFromClass([HJCarModel class])
                                               withMaching:nil
                                             withAttribute:nil
                                                 sortingBy:@"userId"
                                               isAscending:YES];
    HJCarModel *model = array.firstObject;
    model.userName = @"爱听话的孩子";
    BOOL isSuccess = [HJCoreDataManager updateManagedObject:model];
    NSLog(@"%d",isSuccess);
}

/**
 查询数据
 
 @param sender sender description
 */
- (IBAction)coreDataSelectInfoButtonDidClicked:(UIButton *)sender {
    NSArray *array = [HJCoreDataManager selectByEntityName:NSStringFromClass([HJCarModel class])
                                               withMaching:nil
                                             withAttribute:nil
                                                 sortingBy:nil
                                               isAscending:YES];
    if (array.count > 0) {
        for (HJCarModel *model in array) {
            NSLog(@"%@---%@---%lld", model.userName,model.carName,model.userId);
        }
    }
    
}

@end

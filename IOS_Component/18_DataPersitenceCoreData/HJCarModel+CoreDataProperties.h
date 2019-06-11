//
//  HJCarModel+CoreDataProperties.h
//  18_DataPersitenceCoreData
//
//  Created by hongbo ni on 2019/5/28.
//  Copyright © 2019 hongbo ni. All rights reserved.
//
//

#import "HJCarModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface HJCarModel (CoreDataProperties)

+ (NSFetchRequest<HJCarModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *carName;
@property (nonatomic) int64_t userId;
@property (nullable, nonatomic, copy) NSString *userName;

@end

NS_ASSUME_NONNULL_END

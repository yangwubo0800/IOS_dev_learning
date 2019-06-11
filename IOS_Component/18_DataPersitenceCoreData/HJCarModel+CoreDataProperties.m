//
//  HJCarModel+CoreDataProperties.m
//  18_DataPersitenceCoreData
//
//  Created by hongbo ni on 2019/5/28.
//  Copyright © 2019 hongbo ni. All rights reserved.
//
//

#import "HJCarModel+CoreDataProperties.h"

@implementation HJCarModel (CoreDataProperties)

+ (NSFetchRequest<HJCarModel *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"HJCarModel"];
}

@dynamic carName;
@dynamic userId;
@dynamic userName;

@end

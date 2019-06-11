//
//  HJPersonModel+CoreDataProperties.m
//  18_DataPersistenceFMDB
//
//  Created by hongbo ni on 2019/5/28.
//  Copyright © 2019 hongbo ni. All rights reserved.
//
//

#import "HJPersonModel+CoreDataProperties.h"

@implementation HJPersonModel (CoreDataProperties)

+ (NSFetchRequest<HJPersonModel *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"HJPersonModel"];
}

@dynamic name;
@dynamic userId;
@dynamic age;

@end

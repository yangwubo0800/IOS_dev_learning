//
//  HJPersonModel+CoreDataProperties.m
//  
//
//  Created by hongbo ni on 2019/5/28.
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

//
//  HJPersonModel+CoreDataProperties.h
//  
//
//  Created by hongbo ni on 2019/5/28.
//
//

#import "HJPersonModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface HJPersonModel (CoreDataProperties)

+ (NSFetchRequest<HJPersonModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int64_t userId;
@property (nonatomic) int64_t age;

@end

NS_ASSUME_NONNULL_END

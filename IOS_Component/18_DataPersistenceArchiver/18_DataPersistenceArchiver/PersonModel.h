//
//  PersonModel.h
//  18_DataPersistenceArchiver
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//
//@interface PersonModel : NSObject <NSSecureCoding>
//
////@property(nonatomic, copy) NSString* name;
////
////@property(nonatomic, assign) NSInteger age;
//
//@end



@interface PersonModel : NSObject <NSSecureCoding>

@property(nonatomic, copy) NSString *name;

@property(nonatomic, assign) NSInteger age;


@end

NS_ASSUME_NONNULL_END

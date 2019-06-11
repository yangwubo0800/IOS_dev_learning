//
//  PersonModel.m
//  18_DataPersistenceArchiver
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

-(void)encodeWithCoder:(NSCoder *)aCoder{
    NSLog(@" encode with coder");
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age  forKey:@"age"];
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.age = [coder decodeIntegerForKey:@"age"];
    }
    return self;
}

+(BOOL)supportsSecureCoding{
    return  YES;
}

@end

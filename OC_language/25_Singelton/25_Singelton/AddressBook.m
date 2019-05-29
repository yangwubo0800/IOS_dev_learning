//
//  AddressBook.m
//  25_Singelton
//
//  Created by yangwubo on 19/5/6.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "AddressBook.h"

static AddressBook *shareInstance = nil;

@implementation AddressBook

+(AddressBook *)shareInstance{
    if (shareInstance == nil) {
        shareInstance = [[AddressBook alloc] init];
    }
    return shareInstance;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    if (shareInstance == nil) {
        shareInstance = [super allocWithZone:zone];
    }
    
    return shareInstance;
}


//+ (id) allocWithZone:(struct _NSZone *)zone{
//    if(shareInstance == nil){
//        shareInstance = [super allocWithZone:zone];
//    }
//    return shareInstance;
//}

-(id)copyWithZone:(NSZone *)zone{
    return shareInstance;
}


//-(id)retain{
//    return self;
//}

//-(oneway void)release{
//    
//}


//-(id)autorelease{
//    return self;
//}

@end

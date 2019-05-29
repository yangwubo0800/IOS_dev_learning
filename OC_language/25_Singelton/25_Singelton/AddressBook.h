//
//  AddressBook.h
//  25_Singelton
//
//  Created by yangwubo on 19/5/6.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressBook : NSObject

+(AddressBook *)shareInstance;

@end

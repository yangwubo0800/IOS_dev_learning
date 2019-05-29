//
//  Book.h
//  17_KVC&KVO
//
//  Created by yangwubo on 19/5/5.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"

@interface Book : NSObject{
    Author *_author;
}

@property NSString *name;

@property float price;

@end

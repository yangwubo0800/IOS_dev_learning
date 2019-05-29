//
//  Truck.h
//  ClassCharacter
//
//  Created by yangwubo on 19/4/22.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Truck : Car{
    float _maxWeight;
}

-(void)brake;

-(void)unload;

@end

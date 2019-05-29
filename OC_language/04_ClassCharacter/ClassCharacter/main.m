//
//  main.m
//  ClassCharacter
//
//  Created by yangwubo on 19/4/21.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Taxi.h"
#import "Truck.h"
#import "Person.h"
#import "ColorPrinter.h"
#import "BlackPrinter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
//        Car *car = [[Car alloc]init];
//        [car setBrand:@"Benz"];
//        [car brake];
//        
//        Taxi *taxi = [[Taxi alloc] init];
//        [taxi setBrand:@"BWM"];
//        [taxi setColor:@"red"];
//        [taxi printTick];
        
        
//        Truck *truck = [[Truck alloc] init];
//        [truck setBrand:@"dongfeng"];
//        [truck setColor:@"white"];
//        [truck brake];
//        [truck unload];
        
        Person *person = [[Person alloc] init];
        
        ColorPrinter *colorPrinter = [[ColorPrinter alloc] init];
        BlackPrinter *blackPrinter = [[BlackPrinter alloc] init];
        
        int cmd;
        do{
            
            scanf("%d", &cmd);
            if (cmd==1) {
                [person doPrint:colorPrinter];
            } else if (cmd == 2){
                [person doPrint:blackPrinter];
            }
            
        }while (1) ;
        
        
        
        
    }
    return 0;
}

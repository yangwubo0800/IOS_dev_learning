//
//  Nurse.m
//  17_KVC&KVO
//
//  Created by yangwubo on 19/5/5.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "Nurse.h"
#import "Children.h"

@implementation Nurse

-(id)initWithChildren:(Children *)chilren{
    self = [super init];
    if (self != nil) {
        _children = chilren;
        
        [_children addObserver:self forKeyPath:@"happyValue" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:@"context"];
        
        [_children addObserver:self forKeyPath:@"hurryValue" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:@"context"];
        
    }
    
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@" change is %@, keyPath is %@", change, keyPath);
    
    if ([keyPath isEqualToString:@"happyValue"]) {
        NSNumber *happyValue = [change objectForKey:@"new"];
        
        NSInteger value = [happyValue integerValue];
        NSLog(@"happy value value=%ld", value);
        if (value < 90) {
            NSLog(@"happy value smaller 90");
        }
    } else if ([keyPath isEqualToString:@"hurryValue"]){
        NSNumber *hurryValue = [change objectForKey:@"old"];
        
        NSInteger value = [hurryValue integerValue];
        NSLog(@"hurry value value=%ld", value);
        if (value < 90) {
            NSLog(@" hurry value old smaller than 90");
        }
    }
    
    NSLog(@" context param is %@", context);
}


-(void)dealloc{
    [_children removeObserver:self forKeyPath:@"hurryValue"];
    [_children removeObserver:self forKeyPath:@"happyValue"];
}

@end

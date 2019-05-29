//
//  main.m
//  16_FileOperator
//
//  Created by yangwubo on 19/5/4.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSString *path = @"/user/ypj/test.txt";
        
        NSArray *pathArr = [path pathComponents];
        NSLog(@" path array is  %@", pathArr);
        
        NSString *str = [path lastPathComponent];
        NSLog(@"last component is %@", str);
        

        str = [path stringByAppendingString:@"/test2.jpg"];
        NSLog(@"append is %@", str);
    
        
        str = [path stringByAppendingPathComponent:@"test3.jpg"];
        NSLog(@"compent append is %@", str);
        
        str = [path stringByDeletingLastPathComponent];
        NSLog(@"delete last path  is %@", str);
        
        
        str = [path stringByDeletingPathExtension];
        NSLog(@"delete extension path  is %@", str);
        
        str = [path pathExtension];
        NSLog(@" extension path  is %@", str);
        
        str = [path stringByAppendingPathExtension:@"tiananmen"];
        NSLog(@" path extension is %@", str);
        
        //encode
        NSString *encodeStr = @"sdjlflsjdfljsldjfskdjf";
        NSData *data = [encodeStr dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@" encode data is %@", data);
        NSString *decodeStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@" decodeStr  is %@", decodeStr);
        
        
        
        
        
        
    }
    return 0;
}

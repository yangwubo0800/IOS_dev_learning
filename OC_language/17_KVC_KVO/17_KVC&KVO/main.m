//
//  main.m
//  17_KVC&KVO
//
//  Created by yangwubo on 19/5/4.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
#import "Author.h"
#import "Book.h"

#import "Children.h"
#import "Nurse.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Person *person = [[Person alloc] init];
        [person setValue:@"ypj" forKey:@"name"];
        
        Dog *dog = [[Dog alloc] init];
        [person setValue:dog forKey:@"dog"];
        
        
//        
//        NSString *name = [person valueForKey:@"name"];
//        NSLog(@" person name is %@", name);
//        
//        [person setValue:@22 forKey:@"age"];
//        NSLog(@"person is %@", person);
        
        
        //KVC --KEY VALUE CODING
        Author *author = [[Author alloc]init];
        [author setValue:@"moyan" forKey:@"name"];
        
        
        Book *book1 = [[Book alloc]init];
        //[book1 setValue:@9.0 forKey:@"price"];
        book1.price = 9;
        book1.name = @"honggaoliang";
        
        Book *book2 = [[Book alloc] init];
        book2.price = 12;
        book2.name = @"wa";
        
        NSArray *books = [NSArray arrayWithObjects:book1,book2, nil];
        [author setValue:books forKey:@"issueBook"];
        
        NSArray *prices = [author valueForKeyPath:@"issueBook.price"];
        NSLog(@"prices are %@", prices);
        
        NSNumber *count = [author valueForKeyPath:@"issueBook.@count"];
        NSNumber *sum = [author valueForKeyPath:@"issueBook.@sum.price"];
        NSNumber *avg = [author valueForKeyPath:@"issueBook.@avg.price"];
        
        NSLog(@" book count is %@, sum price is %@, avg price is %@", count, sum, avg);
        
        
        // KVO
        Children *chilren = [[Children alloc] init];
        
        Nurse *nurse = [[Nurse alloc] init];
        
        [nurse initWithChildren:chilren];
        
        [[NSRunLoop currentRunLoop] run];
 
        
    }
    return 0;
}

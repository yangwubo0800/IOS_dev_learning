//
//  main.m
//  11_NSStringMethod
//
//  Created by yangwubo on 19/4/24.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        //create string
//        NSString *str1 = @"hello";
//        
//        NSString *str2 = [[NSString alloc] initWithString:@"hello init with string"];
//        
//        NSString *str3 = [[NSString alloc] initWithFormat:@"how %s", "are you?"];
//        
//        NSString *str4 = [NSString stringWithString:@"I'm fine"];
//        
//        NSLog(@" str1 is %@, str2 is %@, str3 is %@, str4 is %@", str1, str2, str3, str4);
        
        
        // compare string
//        NSString *str5 = @"123";
//        NSString *str6 = @"456";
//        if ([str5 isEqualToString:str6]) {
//            NSLog(@" equal");
//        } else{
//            NSLog(@" not equal");
//        }
//        
//        NSString *str7 = @"2222";
//        NSString *str8 = @"2222";
//        if (str7 == str8) {
//            NSLog(@" equal");
//        } else{
//            NSLog(@" not equal");
//        }
//        
//        NSString *str9 = [[NSString alloc] initWithString:@"123"];
//        NSString *str10 = [[NSString alloc] initWithString:@"123"];
//        if (str9 == str10) {
//            NSLog(@" equal ");
//        } else {
//            NSLog(@" NOT EQUAL");
//        }
//        
//        NSString *str11 = [[NSString alloc] initWithFormat:@"123 %@", @"345"];
//        NSString *str12 = [[NSString alloc] initWithFormat:@"123 %@", @"345"];
//        if (str11 == str12) {
//            NSLog(@" FORMAT equal ");
//        } else {
//            NSLog(@" FORMAT NOT EQUAL");
//        }
        
        //compare
//        NSString *str13 = @"zhangsan";
//        NSString *str14 = @"ZHANGSAN";
//        
//        NSComparisonResult result = [str13 caseInsensitiveCompare:str14];
//        if (result == NSOrderedSame) {
//            NSLog(@" str compare is same");
//        }else{
//            NSLog(@" not the same");
//        }
//        
//        
//        
//        NSComparisonResult result2 = [str13 compare:str14];
//        if (result2 == NSOrderedSame) {
//            NSLog(@" str compare is same");
//        }else if(result2 == NSOrderedAscending){
//            NSLog(@" Asc");
//        }else if (result2 == NSOrderedDescending){
//            NSLog(@" Des");
//        }
        
        //length
        
//        NSString *str15 = @"This is a young guy";
//        NSInteger len = [str15 length];
//        NSLog(@" str15 len is %ld", len);
//        
//        
//        NSString *str16 = @"this IS a GUY";
//        NSLog(@"lower case is %@", [str16 lowercaseString]);
//        NSLog(@"uppder case is %@", [str16 uppercaseString]);
//        NSLog(@"capital case is %@", [str16 capitalizedString]);
        
//        NSString *str17 = @"3.1415926";
//        NSLog(@"value of str is %f", [str17 floatValue]);
//        
//        NSString *str18 = @"abcdefg";
//        NSLog(@" substring to %@", [str18 substringToIndex:3]);
//        NSLog(@" substring from %@", [str18 substringFromIndex:3]);
//        NSRange range = {1, 3};
//        NSLog(@" range  %@", [str18 substringWithRange:range]);
        
        //append
//        NSString *str19 = @"Android";
//        NSLog(@" str append is %@", [str19 stringByAppendingString:@" IOS"]);
//        NSLog(@" str append format is %@", [str19 stringByAppendingFormat:@" format %@", @" PC"]);
        
//        NSString *str20 = @"www.iphonetrain.com/ios.html";
//        NSRange range =[str20 rangeOfString:@"ios"];
//        if (range.location == NSNotFound) {
//            NSLog(@" not found");
//        }else{
//            NSLog(@" location is %lu", (unsigned long)range.location);
//        }
        
        
//        NSString *str21 = @"abcdef";
//        unichar s = [str21 characterAtIndex:3];
//        NSLog(@" char is %c", s);
        
        
        //mutual string
        NSMutableString *mutuableStr = [[NSMutableString alloc] initWithString:@"hello mutuable"];
        NSLog(@" mutable string is %@", mutuableStr);
        //this kind of way to create mutable string is also valid, but can not operate insert...
        NSMutableString *str22 = @"pool string";
        NSLog(@" mutable string is %@", str22);
        
        [mutuableStr insertString:@"insert " atIndex:1];
        [mutuableStr appendString:@"append "];
        NSRange range = {1,6};
        [mutuableStr deleteCharactersInRange:range];
        NSRange ranges = [mutuableStr rangeOfString:@"ll"];
        [mutuableStr replaceCharactersInRange:ranges withString:@"ee"];
        NSLog(@" ==== %@", mutuableStr);
        
        
        
        
        
        
        
        
    }
    return 0;
}

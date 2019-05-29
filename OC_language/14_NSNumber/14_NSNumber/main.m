//
//  main.m
//  14_NSNumber
//
//  Created by yangwubo on 19/4/27.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSNumber *num1 = [NSNumber numberWithInt:3];
        NSNumber *num2 = [NSNumber numberWithFloat:3.4];
        NSNumber *num3 = [NSNumber numberWithInt:5];
        
//        NSArray *arr = @[num1, num2, num3];
//        NSLog(@" number array is %@", arr);
//        
//        int value1 = [num1 intValue];
//        float value2 = [num2 floatValue];
//        NSString *value3 = [num2 stringValue];
//        
//        NSLog(@" unpack value %d, %f, %@", value1, value2, value3);
//        
//        NSNumber *num4 = @12;
//        NSLog(@"num4 is %@", num4);
        
//        NSRange range = {1, 3};
//        NSValue *value4 = [NSValue valueWithRange:range];
//        NSLog(@" value4 is %@", value4);
        
//        range = [value4 rangeValue];
//        NSLog(@" unpack range is %@",range);
        
//        struct WXPoint{
//            float x;
//            float y;
//        };
//        
//        struct WXPoint p = {30, 40};
//        NSValue *value5 = [NSValue value:&p withObjCType:@encode(struct WXPoint)];
//        NSLog(@" value5 is %@", value5);
//        
//        struct WXPoint p1;
//        [value5 getValue:&p1];
//        NSLog(@" p1 is %f", p1.x);
//        
//        NSNull *nul1 = [NSNull null];
//        NSNull *nul2 = [NSNull null];
//        
//        NSArray *arr10 = @[nul1, nul2];
//        NSLog(@" ns array is %@", arr10);
        
        
        //date
        NSDate *date = [NSDate date];
        NSDate *date1 = [[NSDate alloc] init];
        date1 = [NSDate dateWithTimeIntervalSinceNow:1000];
        NSLog(@"=== date is %@, date1 is %@", date, date1);
        
//        NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:1000];
//        NSLog(@" --- date2 is %@", date2);
//        
//        NSDate *now = [NSDate date];
//        NSTimeInterval interval = [now timeIntervalSince1970];
//        NSLog(@" time interval since 1970 is %f", interval);
//        interval = [now timeIntervalSinceNow];
//        NSLog(@" time interval since now is %f", interval);
//        NSComparisonResult result = [date compare:date1];
//        if (result == NSOrderedAscending) {
//            NSLog(@" ASC");
//        } else if(result == NSOrderedDescending){
//            NSLog(@" des");
//        } else{
//            NSLog(@" same");
//        }
//        
//        NSDateFormatter *format = [[NSDateFormatter alloc] init];
//        [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        NSString *str = [format stringFromDate:date1];
//        NSLog(@" date str is %@", str);
//        
//        NSTimeZone *zone = [NSTimeZone timeZoneWithName:@"America/New_York"];
//        NSLog(@" nstime zone is %@", zone);
//        [format setTimeZone:zone];
//        str = [format stringFromDate:date1];
//        NSLog(@" after set zone date is %@", str);
//        
//        NSArray *array = [NSTimeZone knownTimeZoneNames];
//        for (NSString *zone1 in array) {
//            NSLog(@"==== zone is %@", zone1 );
//        }
//        
//        NSString *strs = @"2013年12月14日 16:31:08";
//        [format setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
//        date1 = [format dateFromString:strs];
//        NSLog(@" date1 is %@", date1);
        
        
        //exception
        @try {
            NSLog(@" try case");
//            NSString *debug = nil;
//            int len = debug.length;
            int a = 1/0;
            NSLog(@" try case finish %d", a);
        }
        @catch (NSException *exception) {
            NSLog(@" NsException");
        }
        @finally {
            NSLog(@" finally case");
        }
        
        
        
    }
    return 0;
}

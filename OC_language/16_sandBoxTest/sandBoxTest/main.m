//
//  main.m
//  sandBoxTest
//
//  Created by yangwubo on 19/5/4.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSString *home = NSHomeDirectory();
        NSLog(@" home dir is %@", home);
        
        //第二种方式，直接使用Api获取
        //NSDocumentDirectory:Documents文件夹
        //NSLibraryDirectory:Library文件夹
//        NSArray *documentDir = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
//        
//        NSLog(@" document dir is %@", documentDir);
//        
//        
//        NSArray *libDir = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
//        NSLog(@"  lib dir is %@", libDir);
        
        
        // NS FILE MANAGER
        NSString *filePath = [home stringByAppendingPathComponent:@"Documents/file.txt"];
        NSFileManager *manager = [NSFileManager defaultManager];
        
        NSString *str = @"what are you doing";
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        
        BOOL fileSuc = [manager createFileAtPath:filePath contents:data attributes:nil];
        if (fileSuc) {
            NSLog(@"create file succeed filePath is  %@", filePath);
        } else{
            NSLog(@" create file failed");
            
        }
        
        //create dirs
        NSString *fileDir = [home stringByAppendingPathComponent:@"Documents/file"];
        NSError *errors;
        BOOL dirSuc = [manager createDirectoryAtPath:fileDir withIntermediateDirectories:YES attributes:nil error:&errors];
        if (dirSuc) {
            NSLog(@" dir suc and dir path is %@", fileDir);
        }else{
            NSLog(@" dir create failed");
        }
        
        // GET DATA
        NSData *data1 = [manager contentsAtPath:filePath];
        NSString *content1 = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
//        NSLog(@" get data is %@", content1);
        
        
        // move and cut file
        NSString *targetPath = [home stringByAppendingPathComponent:@"Documents/file/file2.txt"];
//        BOOL moveSuc = [manager moveItemAtPath:filePath toPath:targetPath error:&errors];
//        if (moveSuc) {
//            NSLog(@" move file suc and target path is %@", targetPath);
//        } else{
//            NSLog(@" move file failed error is %@", errors);
//        }
        
        //copy file
        targetPath = [home stringByAppendingPathComponent:@"Documents/file/file3.txt"];
        BOOL copySuc = [manager copyItemAtPath:filePath toPath:targetPath error:&errors];
//        if (copySuc) {
//            NSLog(@" copy file is succeed");
//        } else{
//            NSLog(@" copy file is failed error= %@", errors);
//        }
        
        
        // file exist or not
        BOOL fileExist = [manager fileExistsAtPath:filePath];
//        if (fileExist) {
//            NSLog(@" file exist");
//            BOOL del = [manager removeItemAtPath:filePath error:nil];
//            if (del) {
//                NSLog(@" delete file succeed");
//            }else{
//                NSLog(@" delete file failed");
//            }
//        } else{
//            NSLog(@" file not exist");
//        }
        
        
        //attribute
        NSDictionary *attribute = [manager attributesOfItemAtPath:filePath error:nil];
//        NSLog(@" attribute is %@", attribute);
        
        
        
        
        
        //write to file
        NSString *writeFileStr = @"you are gonna reward Gorge and destory Chaile";
        NSString *homePath = NSHomeDirectory();
        NSString *testFilePath = [homePath stringByAppendingPathComponent:@"Documents/testFile.txt"];
        
        BOOL strWrite = [writeFileStr writeToFile:testFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
//        if (strWrite) {
//            NSLog(@" str write succeed");
//            NSString *getStr = [NSString stringWithContentsOfFile:testFilePath encoding:NSUTF8StringEncoding error:nil];
//            NSLog(@" get str from class method is %@", getStr);
//            getStr = [[NSString alloc] initWithContentsOfFile:testFilePath encoding:NSUTF8StringEncoding error:nil];
//            NSLog(@"get str from object method is %@", getStr);
//        } else{
//            NSLog(@" str write failed");
//        }
        
        
        
        // NSDATA WRITE TO FILE
        NSData *dataWrite = [[NSData alloc] initWithContentsOfFile:testFilePath];

        BOOL writeSuc = [dataWrite writeToFile:testFilePath atomically:YES];
//        if (writeSuc) {
//            NSLog(@" NS DATA WRITE SUCCEED");
//            NSString *dataStr = [[NSString alloc] initWithData:dataWrite encoding:NSUTF8StringEncoding];
//            NSLog(@" data str is %@", dataStr);
//        } else{
//            NSLog(@" NS DATA WRITE FAILED");
//        }
        
        
        // NS ARRAY WIRTE TO FILE
        NSArray *arryWrite = @[@"zhangsan", @"lisi"];
        NSString *arrayFilePath = [homePath stringByAppendingPathComponent:@"Documents/array.srclist"];
        BOOL arrayWrite = [arryWrite writeToFile:arrayFilePath atomically:YES];
//        if (arrayWrite) {
//            NSLog(@" array write file succeed");
//            NSArray *getArray = [[NSArray alloc] initWithContentsOfFile:arrayFilePath];
//            NSLog(@"get array content is %@", getArray);
//        }else{
//            NSLog(@" array write file failed");
//        }
        
        // NS DIRECTORY WRITE TO FILE
        NSDictionary *directoryWrite = @{@"zhang":@"zhangsan", @"li":@"lisi"};
        BOOL dicWrite = [directoryWrite writeToFile:arrayFilePath atomically:YES];
//        if (dicWrite) {
//            NSLog(@" directory write succeed");
//            NSDictionary *getDic = [[NSDictionary alloc] initWithContentsOfFile:arrayFilePath];
//            NSLog(@" get dic is %@", getDic);
//            
//        }else{
//            NSLog(@" write dic failed");
//        }
        
        // NS FILE HANDLE
        NSString *handleStr = @"it will make you pround one day , I promise you";
        NSString *handlePath = [homePath stringByAppendingPathComponent:@"Documents/handleFile.txt"];
        [handleStr writeToFile:handlePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        
        
        NSFileHandle *handler = [NSFileHandle fileHandleForWritingAtPath:handlePath];
        [handler seekToEndOfFile];
        NSString *test = @"123";
        NSData *seekData = [test dataUsingEncoding:NSUTF8StringEncoding];
        [handler writeData:seekData];
        [handler closeFile];
        
        
        handler = [NSFileHandle fileHandleForReadingAtPath:handlePath];
        
        NSString *afterAppendStr = [[NSString alloc] initWithContentsOfFile:handlePath encoding:NSUTF8StringEncoding error:nil];
//        NSLog(@" AFTER APPEND STR IS %@", afterAppendStr);
        
        
        //获取文件的大小
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSDictionary *fileAttr = [fileManager attributesOfItemAtPath:handlePath error:nil];
        NSNumber *fileSize = [fileAttr objectForKey:NSFileSize];
        long long sizeValue = [fileSize longLongValue];
        
//        NSLog(@" fileAttr is %@, fileSize is %@, sizeValue is %lld", fileAttr, fileSize, sizeValue);
        
        [handler seekToFileOffset:sizeValue/2];
        NSData *halfData = [handler readDataToEndOfFile];
        NSString *halfStr = [[NSString alloc] initWithData:halfData encoding:NSUTF8StringEncoding];
//        NSLog(@" half str is %@", halfStr);
        
        // COPY FILE
        NSString *targetHandlePath = [homePath stringByAppendingPathComponent:@"files.test"];
        NSFileManager *fileManagers = [NSFileManager defaultManager];
        [fileManagers createFileAtPath:targetHandlePath contents:nil attributes:nil];
        
        NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:handlePath];
        NSFileHandle *writeHandle = [NSFileHandle fileHandleForWritingAtPath:targetHandlePath];
        
        NSData *readData = [readHandle readDataToEndOfFile];
        NSString *readStr = [[NSString alloc] initWithData:readData encoding:NSUTF8StringEncoding];
        NSLog(@" READ DATA IS %@", readStr);
        [writeHandle writeData:readData];
        
        //close handler
        [readHandle closeFile];
        [writeHandle closeFile];
        
        
        
        
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

//
//  ViewController.m
//  20_NSUrlSession
//
//  Created by hongbo ni on 2019/5/29.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [button setTitle:@"request data" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(NSURLSessionTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    [button1 setTitle:@"download task" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor blackColor]];
    [button1 addTarget:self action:@selector(NSURLSessionDownloadTaskTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    [button2 setTitle:@"download task1" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor blackColor]];
    [button2 addTarget:self action:@selector(NSURLSessionDownloadTaskTest1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 200, 50)];
    [button3 setTitle:@"upload task" forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor blackColor]];
    [button3 addTarget:self action:@selector(NSURLSessionUploadTaskTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    
}



#pragma mark --data task
/// 向网络请求数据
- (void)NSURLSessionTest {
    // 1.创建url
    // 请求一个网页
    NSString *urlString = @"http://www.cnblogs.com/mddblog/p/5215453.html";
    // 一些特殊字符编码
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"url is %@", url);
    
    // 2.创建请求 并：设置缓存策略为每次都从网络加载 超时时间30秒
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
    
    // 3.采用苹果提供的共享session
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    
    // 4.由系统直接返回一个dataTask任务
    NSURLSessionDataTask *dataTask = [sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 网络请求完成之后就会执行，NSURLSession自动实现多线程
        NSLog(@"%@",[NSThread currentThread]);
        if (data && (error == nil)) {
            // 网络访问成功
            NSLog(@"data=%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        } else {
            // 网络访问失败
            NSLog(@"error=%@",error);
        }
    }];
    
    // 5.每一个任务默认都是挂起的，需要调用 resume 方法
    [dataTask resume];
}



#pragma mark --download task
/// 文件下载
- (void)NSURLSessionDownloadTaskTest {

    // 1.创建url
    NSString *urlString1 = [NSString stringWithFormat:@"http://192.168.65.41:8088/FileUploadSampleForApp/real.txt"];
    // 一些特殊字符编码
    urlString1 = [urlString1 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url1 = [NSURL URLWithString:urlString1];
    
    
    // 2.创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url1];
    
    // 3.创建会话，采用苹果提供全局的共享session
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    
    // 4.创建任务
    NSURLSessionDownloadTask *downloadTask = [sharedSession downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            // location:下载任务完成之后,文件存储的位置，这个路径默认是在tmp文件夹下!
            // 只会临时保存，因此需要将其另存
            NSLog(@"location:%@",location.path);
            
            // 采用模拟器测试，为了方便将其下载到Mac桌面
            //            NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
            NSString *filePath = @"/Users/hongboni/Desktop/real1.txt";
            NSError *fileError;
            [[NSFileManager defaultManager] copyItemAtPath:location.path toPath:filePath error:&fileError];
            if (fileError == nil) {
                NSLog(@"file save success");
            } else {
                NSLog(@"file save error: %@",fileError);
            }
        } else {
            NSLog(@"download error:%@",error);
        }
    }];
    
    // 5.开启任务
    [downloadTask resume];
}



#pragma mark --download task
/// 文件下载
- (void)NSURLSessionDownloadTaskTest1 {

    // 1.创建url
    NSString *urlString1 = [NSString stringWithFormat:@"http://192.168.65.41:8088/FileUploadSampleForApprrrr/hgfhgfg.txt"];
    // 一些特殊字符编码
    urlString1 = [urlString1 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url1 = [NSURL URLWithString:urlString1];
    
    
    // 2.创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url1];
    NSLog(@"request url is %@", request.URL);

    
    // 3.创建会话，采用苹果提供全局的共享session
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    
    // 4.创建任务
    NSURLSessionDownloadTask *downloadTask = [sharedSession downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            // location:下载任务完成之后,文件存储的位置，这个路径默认是在tmp文件夹下!
            // 只会临时保存，因此需要将其另存
            NSLog(@"location:%@",location.path);
            
            // 采用模拟器测试，为了方便将其下载到Mac桌面
            //            NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
            NSString *filePath = @"/Users/hongboni/Desktop/4444.txt";
            NSError *fileError;
            [[NSFileManager defaultManager] copyItemAtPath:location.path toPath:filePath error:&fileError];
            if (fileError == nil) {
                NSLog(@"file save success");
            } else {
                NSLog(@"file save error: %@",fileError);
            }
        } else {
            NSLog(@"download error:%@",error);
        }
    }];
    
    // 5.开启任务
    [downloadTask resume];
}


#pragma mark -- upload task
/// 以流的方式上传，大小理论上不受限制，但应注意时间
- (void) NSURLSessionBinaryUploadTaskTest {
    // 1.创建url  采用Apache本地服务器
    NSString *urlString = @"http://192.168.65.41:8084/hzinfo-CourseManage/coursemanage/cmFile/addCmFile";
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 2.创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 文件上传使用post
    request.HTTPMethod = @"POST";
    
    // 3.开始上传   request的body data将被忽略，而由fromData提供
    [[[NSURLSession sharedSession] uploadTaskWithRequest:request fromData:[NSData dataWithContentsOfFile:@"/Users/hongboni/Desktop/real.txt"]     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSLog(@"upload success：%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        } else {
            NSLog(@"upload error:%@",error);
        }
    }] resume];
}



#pragma mark --data task

/// 文件上传
- (void)NSURLSessionUploadTaskTest {
    // 1.创建url  采用Apache本地服务器
    NSString *urlString = `;
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 2.创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 文件上传使用post
    request.HTTPMethod = @"POST";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",@"boundary"];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    // 3.拼接表单，大小受MAX_FILE_SIZE限制(2MB)  FilePath:要上传的本地文件路径  formName:表单控件名称，应于服务器一致
    NSData* data = [self getHttpBodyWithFilePath:@"/Users/hongboni/Desktop/real.txt" formName:@"file" reName:nil];
    request.HTTPBody = data;
    
    // 根据需要是否提供，非必须,如果不提供，session会自动计算
    [request setValue:[NSString stringWithFormat:@"%lu",data.length] forHTTPHeaderField:@"Content-Length"];
    
    // 4.1 使用dataTask
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSLog(@"upload success：%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        } else {
            NSLog(@"upload error:%@",error);
        }
        
    }] resume];
#if 0
    // 4.2 开始上传 使用uploadTask   fromData:可有可无，会被忽略
    [[[NSURLSession sharedSession] uploadTaskWithRequest:request fromData:nil     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSLog(@"upload success：%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        } else {
            NSLog(@"upload error:%@",error);
        }
    }] resume];
#endif
}



/// filePath:要上传的文件路径   formName：表单控件名称  reName：上传后文件名
- (NSData *)getHttpBodyWithFilePath:(NSString *)filePath formName:(NSString *)formName reName:(NSString *)reName
{
    NSMutableData *data = [NSMutableData data];
    NSURLResponse *response = [self getLocalFileResponse:filePath];
    // 文件类型：MIMEType  文件的大小：expectedContentLength  文件名字：suggestedFilename
    NSString *fileType = response.MIMEType;
    NSLog(@"=====fileType is %@", fileType);
    
    // 如果没有传入上传后文件名称,采用本地文件名!
    NSLog(@"rename is %@", reName);
    if (reName == nil) {
        reName = response.suggestedFilename;
        NSLog(@"suggestedFilename is %@", reName);
    }
    
    // 表单拼接
    NSMutableString *headerStrM =[NSMutableString string];
    [headerStrM appendFormat:@"--%@\r\n",@"boundary"];
    // name：表单控件名称  filename：上传文件名
    [headerStrM appendFormat:@"Content-Disposition: form-data; name=%@; filename=%@\r\n",formName,reName];
    [headerStrM appendFormat:@"Content-Type: %@\r\n\r\n",fileType];
    [data appendData:[headerStrM dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 文件内容
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    [data appendData:fileData];
    
    NSMutableString *footerStrM = [NSMutableString stringWithFormat:@"\r\n--%@--\r\n",@"boundary"];
    [data appendData:[footerStrM  dataUsingEncoding:NSUTF8StringEncoding]];
    //    NSLog(@"dataStr=%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    return data;
}



/// 获取响应，主要是文件类型和文件名
- (NSURLResponse *)getLocalFileResponse:(NSString *)urlString
{
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    // 本地文件请求
    NSURL *url = [NSURL fileURLWithPath:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    __block NSURLResponse *localResponse = nil;
    // 使用信号量实现NSURLSession同步请求
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        localResponse = response;
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return  localResponse;
}


@end

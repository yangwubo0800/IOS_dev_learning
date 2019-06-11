//
//  ViewController.m
//  20_AFNetworking
//
//  Created by hongbo ni on 2019/5/30.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [button setTitle:@"AFNetworking get" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(AFNGet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    [button1 setTitle:@"AFNetworking post" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor blackColor]];
    [button1 addTarget:self action:@selector(AFNPost) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    [button2 setTitle:@"AFNetworking download" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor blackColor]];
    [button2 addTarget:self action:@selector(downLoad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 200, 50)];
    [button3 setTitle:@"AFNetworking upload" forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor blackColor]];
    [button3 addTarget:self action:@selector(upLoad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    
    
}


-(void)AFNGet{
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    NSDictionary *dict = @{
                           @"name":@"湖南省",
                           @"grade":@"3"
                           };
    // parameters 参数字典
    [manager GET:@"http://192.168.65.41:8070/abcdefg-web/area/areaInfo/queryAreaWithGradeByConfig" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        //进度
        //进度
        NSLog(@"=====downloadProgress is %lld", downloadProgress.completedUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // task 我们可以通过task拿到响应头
        NSLog(@" success response is %@", task.response);
        
        // responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组)
        NSLog(@" success responseObject is %@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // error 错误信息
        NSLog(@" failure response is %@", task.response);
        NSLog(@" failure error is %@", error.description);
    }];
}


-(void)AFNPost{
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    NSDictionary *dict = @{
                           @"name":@"湖南省",
                           };
    // parameters 参数字典
    [manager POST:@"http://192.168.65.41:8070/abcdefg-web/area/areaConf/addAreaConfig" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        //进度
        NSLog(@"=====downloadProgress is %lld", downloadProgress.completedUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // task 我们可以通过task拿到响应头
        NSLog(@" success response is %@", task.response);
        // responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组)
        NSLog(@" success responseObject is %@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // error 错误信息
        NSLog(@" failure response is %@", task.response);
        NSLog(@" failure error is %@", error.description);
    }];
    
}


-(void)downLoad{
    // 1.创建一个管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 2. 创建请求对象
    NSURL *url = [NSURL URLWithString:@"http://192.168.65.41:8088/FileUploadSampleForApp/real.txt"];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    // 3. 下载文件
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        // downloadProgress.completedUnitCount 当前下载大小
        // downloadProgress.totalUnitCount 总大小
        NSLog(@"%f", 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // targetPath  临时存储地址
        NSLog(@"targetPath:%@",targetPath);
//        NSString *path =[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = @"/Users/hongboni/Desktop";
        
        NSString *filePath = [path stringByAppendingPathComponent:response.suggestedFilename];
        
        NSURL *url = [NSURL fileURLWithPath:filePath];
        NSLog(@"path:%@",filePath);
        // 返回url 我们想要存储的地址
        // response 响应头
        return url;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        // 下载完成之后调用
        // response 响应头
        // filePath 下载存储地址
        NSLog(@"filePath:%@", filePath);
        //NSLog(@"completionHandler response:%@", response);
    }];
    
    // 需要手动开启
    [downloadTask resume];
}



-(void)upLoad{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"http://192.168.65.41:8084/hzinfo-CourseManage/coursemanage/cmFile/addCmFile";
    
    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // formData 将要上传的数据
        // 直接传URL
        NSURL *url =[NSURL fileURLWithPath:@"/Users/hongboni/Desktop/real.txt"];
        
        NSString *mimeType = [self connectSync:@"/Users/hongboni/Desktop/real.txt"];
        // 方法一
        [formData appendPartWithFileURL:url name:@"file" fileName:@"newReal.txt" mimeType:mimeType  error:nil];
        // 方法二
        /**
         这个方法会自动截取url最后一块的文件名作为上传到服务器的文件名
         也会自动获取mimeType，如果没有办法获取mimeType 就使用@"application/octet-stream" 表示任意的二进制数据 ，当我们不在意文件类型的时候 也可以用这个。
         */
        [formData appendPartWithFileURL:url name:@"file" error:nil];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 上传进度
        NSLog(@"upload progress is %lld", uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 上传成功
        NSLog(@"上传成功");
        NSLog(@"responseObject:%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 上传失败
        NSLog(@"上传失败");
    }];
    
}


// 通过发送请求获取mimeType
-(NSString *)connectSync:(NSString *)path
{
    //1.确定请求路径
    NSURL *url = [NSURL fileURLWithPath:path];
    
    //NSURL *url =[NSURL fileURLWithPath:@"/Users/hongboni/Desktop/real.txt"];
    
    //2.创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSHTTPURLResponse *res = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&res error:nil];
    NSLog(@"%@",res.MIMEType);
    return res.MIMEType;
}


@end

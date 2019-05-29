//
//  ViewController.m
//  05_WKWebview
//
//  Created by yangwubo on 19/5/10.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController () <WKNavigationDelegate>

@property(strong, nonatomic) WKWebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect screen = [[UIScreen mainScreen]bounds];
    CGFloat buttonBarWidth = 316;
    UIView *buttonBar = [[UIView alloc] initWithFrame:CGRectMake((screen.size.width - buttonBarWidth)/2, 20, buttonBarWidth, 60)];
    
    [self.view addSubview:buttonBar];
    
    
    //    UIButton *requestBt = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 50, 30)];
    //    [requestBt : UIButtonTypeSystem];
    //requestBt.buttonType = UIButtonTypeSystem;
    
    UIButton *requestBt = [UIButton buttonWithType:UIButtonTypeSystem ];
    [requestBt setTitle:@"request" forState:UIControlStateNormal];
    requestBt.frame = CGRectMake(20, 0, 100, 50);
    [requestBt addTarget:self action:@selector(testLoadRequest:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonBar addSubview:requestBt];
    
    
    
    //html button
    UIButton *htmlBt = [UIButton buttonWithType:UIButtonTypeSystem ];
    [htmlBt setTitle:@"load html" forState:UIControlStateNormal];
    htmlBt.frame = CGRectMake(120, 0, 100, 50);
    [htmlBt addTarget:self action:@selector(testLoadHtml:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonBar addSubview:htmlBt];
    
    
    //DATA BUTTON
    
    UIButton *dataBt = [UIButton buttonWithType:UIButtonTypeSystem ];
    [dataBt setTitle:@"load data" forState:UIControlStateNormal];
    dataBt.frame = CGRectMake(220, 0, 100, 50);
    [dataBt addTarget:self action:@selector(testLoadData:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonBar addSubview:dataBt];
    
    
    
    //WEBVIEW
    
    self.webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, 60, screen.size.width, screen.size.height-80)];
    [self.view addSubview:self.webview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)testLoadData:(id)sender{
    NSLog(@"test load data");
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index1.html" ofType:nil inDirectory:@"H5"];
    NSLog(@"test load DATA htmlPath=%@", htmlPath);
    
    NSData *data = [[NSData alloc] initWithContentsOfFile:htmlPath];
    
    NSURL *baseUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
    NSLog(@"test load DATA baseUrl=%@", baseUrl);

    [self.webview loadData:data MIMEType:@"text/html" characterEncodingName:@"UTF-8" baseURL:baseUrl];
    
    
}


-(void)testLoadHtml:(id)sender{
    NSLog(@"test load html");
    NSString *htmlPath = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSLog(@"test load html htmlPath=%@", htmlPath);
    
    NSError *error = [[NSError alloc] init];
    
    NSString *htmlContent = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:&error];
    
    NSLog(@"test load html htmlContent=%@ error is %p", htmlContent, error);
    
    
    [self.webview loadHTMLString:htmlContent baseURL:nil];
}

-(void)testLoadRequest:(id)sender{
    NSLog(@" LOAD REQUEST");
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
    self.webview.navigationDelegate = self;
}


-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@" start provisional navigation");
    
}

-(void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@" did fail provisional navigation error=%@", error.description);
}

@end

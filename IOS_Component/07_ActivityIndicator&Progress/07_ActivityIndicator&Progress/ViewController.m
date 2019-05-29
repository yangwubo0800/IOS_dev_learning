//
//  ViewController.m
//  07_ActivityIndicator&Progress
//
//  Created by yangwubo on 19/5/11.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIActivityIndicatorView *indicator;

@property (strong, nonatomic) UIProgressView *progress;

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGRect frame = self.indicator.frame;
    frame.origin = CGPointMake((screen.size.width - self.indicator.frame.size.width)/2, 80);
    self.indicator.frame = frame;
    
    self.indicator.hidesWhenStopped = false;
    [self.view addSubview:self.indicator];
    
    
    UIButton *upload = [UIButton buttonWithType:UIButtonTypeSystem];
    [upload setTitle:@"UPLOAD" forState:UIControlStateNormal];
    upload.frame = CGRectMake((screen.size.width - 100)/2, 100, 100, 50);
    
    [upload addTarget:self action:@selector(startMove:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:upload];
    
    
    
    // progress
    CGFloat progressWidth = 100;
    CGFloat progressHeight = 30;
    CGFloat progressTopView = 200;
    
    self.progress = [[UIProgressView alloc] initWithFrame:CGRectMake((screen.size.width - progressWidth)/2, progressTopView, progressWidth, progressHeight)];
    [self.view addSubview:self.progress];
    
    UIButton *download = [UIButton buttonWithType:UIButtonTypeSystem];
    [download setTitle:@"download" forState:UIControlStateNormal];
    download.frame = CGRectMake((screen.size.width - 100)/2, 250, 100, 50);
    
    [download addTarget:self action:@selector(downloadProgress:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:download];
    
}

-(void)download{
    NSLog(@"download....");
    self.progress.progress = self.progress.progress + 0.1;
    if (self.progress.progress == 1.0) {
        [self.timer invalidate];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"download title" message:@"download complete" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        
        [self presentViewController:alert animated:true completion:nil];
    }
}

-(void)downloadProgress:(id)sender{
    NSLog(@" download progress");
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(download) userInfo:nil repeats:YES];
    
}

-(void)startMove:(id)sender{
    NSLog(@"start move ");
    if (self.indicator.isAnimating) {
        self.indicator.stopAnimating;
    } else{
        self.indicator.startAnimating;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

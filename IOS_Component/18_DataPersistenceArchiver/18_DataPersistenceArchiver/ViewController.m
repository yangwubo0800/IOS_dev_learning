//
//  ViewController.m
//  18_DataPersistenceArchiver
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"
#import "PersonModel.h"
#import "ArchiverTool.h"
#import "SandBoxTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadButton];
}


-(void)loadButton{
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [button1 setTitle:@"archive" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor blackColor]];
    [button1 addTarget:self action:@selector(archiveClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    [button2 setTitle:@"unarchive" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor blackColor]];
    [button2 addTarget:self action:@selector(unarchiveClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 50)];
    [button3 setTitle:@"saveMusic" forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor blackColor]];
    [button3 addTarget:self action:@selector(saveMusic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100, 50)];
    [button4 setTitle:@"getMusic" forState:UIControlStateNormal];
    [button4 setBackgroundColor:[UIColor blackColor]];
    [button4 addTarget:self action:@selector(getMusic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    
}

-(void)getMusic{
    NSString *path = [SandBoxTool toolGetMusicFromCache:@"ypj"];
    NSLog(@"get music path is %@", path);
}

-(void)saveMusic{
    
    NSString *originalPath = [ArchiverTool getPathWithPrefix:@"ypj"];
    NSLog(@" original path: %@", originalPath);
    [SandBoxTool toolToSaveMusicToCache:originalPath withMusicName:@"ypj"];
    
}

-(void)archiveClick{
//    PersonModel *model = [[PersonModel alloc] init];
    PersonModel *model = [PersonModel new];
    model.name = @"ypj";
    model.age = 44;
    if ([ArchiverTool archiveObject:model prefix:@"ypj"]) {
        NSLog(@"archive success");
    }else{
        NSLog(@"archive failed");
    }
}

-(void)unarchiveClick{
    PersonModel *content = [ArchiverTool unarchiveObject:PersonModel.class prefix:@"ypj"];
    NSString *name  = content.name;
    NSInteger age  = content.age;
   
    NSLog(@" unarchive content is %@", content);
    NSLog(@" unarchive name is %@", name);
    NSLog(@" unarchive age is %ld", age);
    
}

@end

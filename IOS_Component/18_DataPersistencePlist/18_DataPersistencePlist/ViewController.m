//
//  ViewController.m
//  18_DataPersistencePlist
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"
#import "NSUserDefaults+UserDefaultsTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadButton];
}


-(void)loadButton{
    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    
    [button setTitle:@"plist" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    UIButton *button1  = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    
    [button1 setTitle:@"buttonSave" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor blackColor]];
    [button1 addTarget:self action:@selector(saveClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
    
    
    UIButton *button2  = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 50)];
    
    [button2 setTitle:@"buttonGet" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor blackColor]];
    [button2 addTarget:self action:@selector(getClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button2];
}


-(void)buttonClick:(id)sender{
    NSLog(@" button click");
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"];
    NSLog(@"plist path is %@", plistPath);
    
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSLog(@" dic is %@", dic);
    
    //NS array
    
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSLog(@" array is %@", array);
}


-(void)saveClick:(id)sender{
    [NSUserDefaults savePhoneNumber:@"13388889999"];
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"%@", paths[0]);
    
}


-(NSString *)getClick{
    NSString *number = [NSUserDefaults getPhoneNumber];
    NSLog(@" get phone number is %@", number);
    return number;
}
@end

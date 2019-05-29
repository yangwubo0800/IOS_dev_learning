//
//  ViewController.m
//  08_ToolBar&Navigation
//
//  Created by yangwubo on 19/5/12.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // CREATE TOOLBAR
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat toolBarHeight = 40;
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, screen.size.height - toolBarHeight, screen.size.width, toolBarHeight)];
    

    
    //CREATE bar button ITME
    
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    
    
    
    UIBarButtonItem *open = [[UIBarButtonItem alloc] initWithTitle:@"open" style:UIBarButtonItemStylePlain target:self action:@selector(open:)];
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    //add button item to too bar
    
    toolbar.items = @[save, flexible, open];
    [self.view addSubview:toolbar];
    
    //response for label
    CGFloat lableWidth = 100;
    CGFloat lableHeight = 35;
    CGFloat lableTopview = 200;
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - lableWidth)/2, lableTopview, lableWidth, lableHeight)];
    self.label.text = @"LABEL";
    
    [self.view addSubview:self.label];
    
    
    // create navigation
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 30, screen.size.width, 44)];
    
    //save and add button
    
    UIBarButtonItem *saveNiv = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    
    //create navigation item
    UINavigationItem *navi = [[UINavigationItem alloc] initWithTitle:@"navigation"];
    
    navi.leftBarButtonItem = saveNiv;
    navi.rightBarButtonItem = add;
    
    navigationBar.items = @[navi];
    [self.view addSubview:navigationBar];
    //response for button
    
    
}

-(void)add:(id)sender{
    NSLog(@"bar button add");
    self.label.text = @"add";
}

-(void)open:(id)sender{
    NSLog(@"bar button open");
    self.label.text = @"open";
}


-(void)save:(id)sender{
    NSLog(@"bar button save");
    self.label.text = @"save";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

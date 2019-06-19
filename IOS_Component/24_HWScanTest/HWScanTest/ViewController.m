//
//  ViewController.m
//  HWScanTest
//
//  Created by sxmaps_w on 2017/2/17.
//  Copyright © 2017年 hero_wqb. All rights reserved.
//

#import "ViewController.h"
#import "HWScanViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建控件
    [self creatControl];
}

- (void)creatControl
{
    //扫一扫按钮
    UIButton *scanBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 44)];
    scanBtn.backgroundColor = [UIColor orangeColor];
    [scanBtn setTitle:@"扫一扫" forState:UIControlStateNormal];
    [scanBtn addTarget:self action:@selector(scanBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scanBtn];
}

- (void)scanBtnOnClick
{
    HWScanViewController *vc = [[HWScanViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

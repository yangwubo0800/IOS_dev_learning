//
//  ViewController.m
//  16_CoCoPodUse
//
//  Created by hongbo ni on 2019/5/23.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "AFNetWorking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Do any additional setup after loading the view, typically from a nib.
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(20, 40, 200, 200)];
    view1.backgroundColor=[UIColor redColor];
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    view2.backgroundColor=[UIColor greenColor];
    [view1 addSubview:view2];
    [self.view addSubview:view1];


    UILabel * label = [[UILabel alloc]init];
    //使用代码布局 需要将这个属性设置为NO
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.backgroundColor = [UIColor redColor];
    //创建x居中的约束
    NSLayoutConstraint * constraintx = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    //创建y居中的约束
    NSLayoutConstraint * constrainty = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    //创建宽度约束
    NSLayoutConstraint * constraintw = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200];
    //创建高度约束
    NSLayoutConstraint *constrainth = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200];
    label.text = @"constaint label";
    //添加约束之前，必须将视图加在父视图上
    [self.view addSubview:label];
    [self.view addConstraints:@[constraintx,constrainty,constrainth,constraintw]];


    //use Masonry framework
    UILabel *label2 = [[UILabel alloc] init];
    //first, add view
    [self.view addSubview: label2];
    //then, add constraint
    [label2 mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.center.equalTo(self.view);
        maker.height.equalTo(@414);
        maker.width.equalTo(@410);
    }];
    label2.backgroundColor = [UIColor greenColor];
    label2.text = @"Masonry";


    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    NSLog(@"screen size heigth: %f, width :%f", screenSize.height, screenSize.width);
    NSString *sizeStr = [NSString stringWithFormat:@"%f,x %f", screenSize.height, screenSize.width];
    label2.text = sizeStr;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > screenSize.width) {
            NSLog(@" portrait mode");
            if (screenSize.height == 568) {
                NSLog(@"iphone 5");
            } else if (screenSize.height == 667){
                NSLog(@" iphone 6");
            }else{
                NSLog(@"other iphone");
            }
        }else{
            NSLog(@" landscape mode");
        }
    }

}


@end

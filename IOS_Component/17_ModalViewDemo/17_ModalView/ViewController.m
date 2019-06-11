//
//  ViewController.m
//  17_ModalView
//
//  Created by hongbo ni on 2019/5/24.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () <SecondViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"modal"]) {
        SecondViewController *secondeVC = segue.destinationViewController;
        secondeVC.info = self.TextField.text;
    }
}


-(void)setTextWithBackInfo:(NSString *)info{
    NSLog(@"set text with back info ");
    self.TextField.text = info;
}



// 通过点击出发寻找故事板中的标识的控制器视图来进行跳转
- (IBAction)forwardClick:(id)sender {
    NSLog(@"forward click");
   //find storyboard
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //find second view controller
    SecondViewController *secondVC = [storyBoard instantiateViewControllerWithIdentifier:@"second"];
    
    //pass text to second view
//    secondVC.info = self.TextField.text;
    
    //set delegate
    secondVC.delegate = self;
    
    //show modal view
    [self presentViewController:secondVC animated:YES completion:nil];
    
    
}


#pragma mark implement protocol

- (void)secondVC:(nonnull SecondViewController *)vc didFinishedWithInfo:(nonnull NSString *)info {
    NSLog(@" delegate did finish with info");
    self.TextField.text = info;
}



@end

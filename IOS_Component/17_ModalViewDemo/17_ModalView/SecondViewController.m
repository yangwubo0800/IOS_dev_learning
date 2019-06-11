//
//  SecondViewController.m
//  17_ModalView
//
//  Created by hongbo ni on 2019/5/24.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()



@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label.text = self.info;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButtonClick:(id)sender {
    
    //pass data to presenting view
    
//    ViewController *VC = (ViewController*) self.presentingViewController;
//    [VC setTextWithBackInfo:self.sendTextField.text];
    
    //call delegate to pass data
    [self.delegate secondVC:self didFinishedWithInfo:self.sendTextField.text];

    //close modal view
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    NSLog(@" back button click action");
    
}

@end

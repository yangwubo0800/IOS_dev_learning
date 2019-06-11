//
//  ViewController.h
//  17_ModalView
//
//  Created by hongbo ni on 2019/5/24.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(void)setTextWithBackInfo: (NSString*)info;
@property (weak, nonatomic) IBOutlet UITextField *TextField;
- (IBAction)forwardClick:(id)sender;

@end


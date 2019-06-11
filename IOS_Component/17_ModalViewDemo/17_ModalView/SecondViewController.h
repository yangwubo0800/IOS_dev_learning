//
//  SecondViewController.h
//  17_ModalView
//
//  Created by hongbo ni on 2019/5/24.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//declare protocol
@protocol  SecondViewControllerDelegate;

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *sendTextField;
- (IBAction)backButtonClick:(id)sender;
@property (copy, nonatomic) NSString *info;
@property (weak, nonatomic) IBOutlet UILabel *label;


//declare property for delegate
@property(weak, nonatomic) id<SecondViewControllerDelegate> delegate;

@end

//define protocol
@protocol  SecondViewControllerDelegate

-(void)secondVC:(SecondViewController*)vc didFinishedWithInfo:(NSString *)info;

@end

NS_ASSUME_NONNULL_END

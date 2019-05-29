//
//  ViewController.m
//  09_DatePickSample
//
//  Created by hongbo ni on 2019/5/14.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //create ui date picker
    CGRect screen = [[UIScreen mainScreen]bounds];
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    self.datePicker.locale = [NSLocale 	localeWithLocaleIdentifier:@"zh-Hans"];
    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [self.view addSubview:self.datePicker];
    
    //show label
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - 200)/2, 300, 200, 30)];
    self.label.text = @"label";
    [self.view addSubview:self.label];
    
    
    
    //show button with selector response to change label text
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake((screen.size.width - 100)/2, 400, 100, 30);
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button];
}

-(void)onClick:(id)sender{
    NSLog(@" button on click");
    NSDate *date = self.datePicker.date;
    NSLog(@"the date is %@", date);
    NSLog(@"date locale is %@", [date descriptionWithLocale:[NSLocale currentLocale]]);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    NSLog(@" format date is %@", [formatter stringFromDate:date]);
    self.label.text = [formatter stringFromDate:date];
    
}

@end

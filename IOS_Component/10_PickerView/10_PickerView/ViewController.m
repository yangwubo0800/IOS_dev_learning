//
//  ViewController.m
//  10_PickerView
//
//  Created by hongbo ni on 2019/5/14.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
//define picker view
@property(strong, nonatomic) UIPickerView *pickView;

@property(strong, nonatomic) UILabel *label;

//all data dictionary
@property(strong, nonatomic) NSDictionary *allData;

//province data array
@property(strong, nonatomic) NSArray *provinceDate;


//city data array
@property(strong, nonatomic) NSArray *cityData;

@end

//implement delegate and data source
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //get all data from the list file
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *listPath = [bundle pathForResource:@"province_city" ofType:@"plist"];
    NSLog(@"list path  is %@", listPath);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:listPath];
    self.allData = dict;
    NSLog(@"all data is %@", self.allData);
    
    //all keys as province data
    self.provinceDate = [self.allData allKeys];
    NSLog(@"province data is %@", self.provinceDate);
    // first province data as city data
    
    NSString *selectedProvince = [self.provinceDate objectAtIndex:0];
    NSLog(@"selectedProvince is %@", selectedProvince);
    self.cityData = [self.allData objectForKey:selectedProvince];
    NSLog(@"city data is %@", self.cityData);
    
    
    //create picker view
    CGFloat pickViewWidth = 300;
    CGFloat pickvViewHeight = 300;
    self.pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, pickViewWidth, pickvViewHeight)];
    [self.view addSubview:self.pickView];
    
    //create label to show picker content
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 350, 300, 30)];
    self.label.text = @"label";
    [self.view addSubview:self.label];
    
    // create button to change picker content
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(200, 400, 50, 30);
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    self.pickView.dataSource = self;
    self.pickView.delegate = self;
    
}

-(void)onClick:(id)sender{
    NSLog(@" on click");
    NSInteger row1 = [self.pickView selectedRowInComponent:0];
    NSInteger row2 = [self.pickView selectedRowInComponent:1];
    NSString *selected1 = [self.provinceDate objectAtIndex:row1];
    NSString *selected2 = [self.cityData objectAtIndex:row2];
    
    NSString *title  = [NSString stringWithFormat:@"province:%@, city:%@", selected1,selected2];
    NSLog(@" on click title=%@", title);
    
    self.label.text = title;
    
    
}

#pragma mark --data source
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSLog(@"numberOfComponentsInPickerView");
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSLog(@"numberOfRowsInComponent is %ld", (long)component);
    if (component == 0) {
        return self.provinceDate.count;
    }else{
        return self.cityData.count;
    }
}


#pragma mark --picker view delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSLog(@"picker view titleForRow is %ld", (long)component);
    if (component == 0) {
        return [self.provinceDate objectAtIndex:row];
    }else{
        return [self.cityData objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"picker view component is %ld", (long)component);
    if (component == 0) {
        NSString *selectProvince = [self.provinceDate objectAtIndex:row];
        NSArray *array = [self.allData objectForKey:selectProvince];
        self.cityData = array;
        NSLog(@"picker view array is %@", array);
        [self.pickView reloadComponent:1];
    }
}

@end

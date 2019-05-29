//
//  ViewController.m
//  04_Switch&Segment&Slide
//
//  Created by yangwubo on 19/5/9.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//define attribute
@property (strong, nonatomic) UISwitch *leftSwitch;
@property (strong, nonatomic) UISwitch *rightSwitch;
@property (strong, nonatomic) UILabel *slideValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect screen = [[UIScreen mainScreen]bounds];
    CGFloat gap = 39;
    
    self.leftSwitch = [[UISwitch alloc] init];
    CGRect frame = self.leftSwitch.frame;
    frame.origin = CGPointMake(gap, 98);
    self.leftSwitch.frame = frame;
    self.leftSwitch.on = true;
    
    CGFloat leftX = self.leftSwitch.frame.origin.x;
    
    
    self.rightSwitch = [[UISwitch alloc] init];
    CGRect rightFrame = self.rightSwitch.frame;
    rightFrame.origin = CGPointMake(self.leftSwitch.frame.origin.x + self.leftSwitch.frame.size.width+ gap, 98);
    self.rightSwitch.frame = rightFrame;
    self.rightSwitch.on = false;
    CGFloat rightX = self.rightSwitch.frame.origin.x;
//    self.rightSwitch.frame.origin = CGPointMake(self.leftSwitch.frame.origin.x + gap, 98);
    
    
    [self.view addSubview:self.leftSwitch];
    NSLog(@" view did load, add left switch");
    [self.leftSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.rightSwitch];
    NSLog(@" left x is %f, right x is %f", leftX, rightX);
    [self.rightSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    
    // SEGMENTED
    NSArray *segment = @[@"left", @"middle", @"right"];
    UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:segment];
    
    CGFloat ssWidth = 200;
    CGFloat ssHeight = 30;
    CGFloat ssTopView = 150;
    
    CGRect ssFrame = CGRectMake((screen.size.width - ssWidth)/2, ssTopView, ssWidth, ssHeight);
    sc.frame = ssFrame;
    
    [self.view addSubview:sc];
    
    [sc addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventValueChanged];
    
    
    // SLIDER
    UISlider *slider = [[UISlider alloc] init];
    CGFloat sliderWith = 200;
    CGFloat slideHeight = 30;
    CGFloat sliderTopView = 200;
    
    CGRect slideFrame = CGRectMake((screen.size.width - sliderWith)/2, sliderTopView, sliderWith, slideHeight);
    
    
    slider.frame = slideFrame;
    
    slider.minimumValue = 0.0f;
    slider.maximumValue = 100.0f;
    slider.value = 50.0f;
    
    [self.view addSubview:slider];
    [slider addTarget:self action:@selector(slideValueChange:) forControlEvents:UIControlEventValueChanged];
    
    UILabel *slideName = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - sliderWith)/2, sliderTopView + 50, sliderWith, slideHeight)];
    slideName.text = @" slide value:";
    [self.view addSubview:slideName];
    
    CGRect slideValueFrame = CGRectMake((screen.size.width - sliderWith)/2, sliderTopView + 50 + 30, sliderWith, slideHeight);
    self.slideValue = [[UILabel alloc] init];
    self.slideValue.frame = slideValueFrame;
    self.slideValue.text = @" vlaue hint";
    
    [self.view addSubview:self.slideValue];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


-(void)switchValueChanged:(id)sender{
    UISwitch *ss = (UISwitch*)sender;
    BOOL setting  = ss.isOn;
    NSLog(@" switch value changed setting is %hhd", setting);
    [self.leftSwitch setOn:setting animated:true];
    [self.rightSwitch setOn:setting animated:true];
    
}

-(void)touchDown:(id)sender{
    UISegmentedControl *sc =(UISegmentedControl*)sender;
    NSLog(@"select part is %d", sc.selectedSegmentIndex);
    
    if (self.leftSwitch.hidden) {
        self.leftSwitch.hidden = false;
        
    }else{
        self.leftSwitch.hidden = true;
    }
}


-(void)slideValueChange:(id)sender{
    UISlider *slider = (UISlider*)sender;
    float progress = slider.value;
    NSLog(@" progress is %f", progress);
    
    NSString *value = [[NSString alloc] initWithFormat:@"%f", progress];
    self.slideValue.text = value;
}

@end

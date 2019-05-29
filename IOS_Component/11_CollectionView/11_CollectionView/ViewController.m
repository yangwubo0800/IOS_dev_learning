//
//  ViewController.m
//  11_CollectionView
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"
#import "EventCollectionViewCell.h"

//protocal
@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>{
    int COL_NUM;
}

//event array
@property(strong, nonatomic) NSArray *event;

//ui collection view
@property(strong, nonatomic) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    COL_NUM = 2;
    
    //get event from plist file
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *eventPath = [bundle pathForResource:@"event" ofType:@"plist"];
    NSLog(@"eventPath is %@", eventPath);
    
    NSMutableArray *mutable = [[NSMutableArray alloc] init];
    for(int i=0; i<8; i++){
        [mutable addObject:[NSString stringWithFormat:@"%d", i]];
    }
    //self.event = [NSArray arrayWithContentsOfFile:eventPath];
    self.event = mutable;
    
    NSLog(@"event array is %@", self.event);

    //setup collection view
    [self setUpCollectionView];
}

//setUpCollectionView
-(void)setUpCollectionView{
    //1 create layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //2 set layout param
    layout.itemSize = CGSizeMake(150, 150);
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    
    
    //3 use layout create collection view
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame  collectionViewLayout:layout];
    [self.collectionView registerClass:[EventCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    self.collectionView.backgroundColor = [UIColor grayColor];
    
    //4 set delegate and data source to view
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //5 add view
    [self.view addSubview:self.collectionView];
}



#pragma mark data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"numberOfItemsInSection");
    return COL_NUM;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"cellForItemAtIndexPath");
    
    EventCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    NSDictionary *event = self.event[indexPath.section * COL_NUM + indexPath.row];
    
//    cell.label.text = [event objectForKey:@"name"];
//    cell.imageView.image = [event objectForKey:@"image"];
    
    
    cell.label.text = @"debug";

    
    return cell;
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    NSLog(@"numberOfSectionsInCollectionView");
    
    NSUInteger num = [self.event count] % COL_NUM;
    if (num == 0) {
        return [self.event count]/ COL_NUM;
    }else{
        return [self.event count]/ COL_NUM + 1;
    }
    
}


#pragma mark delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *event = self.event[indexPath.section * COL_NUM + indexPath.row];
    //NSLog(@"select event name is %@, %@", event[@"name"], [event objectForKey:@"name"]);
    NSLog(@" didSelectItemAtIndexPath event= %@", event);
    NSLog(@" didSelectItemAtIndexPath indexPath= %@", indexPath);
    NSLog(@" didSelectItemAtIndexPath self.event= %@", self.event);
}


- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@" did deselect item");
    
}

@end

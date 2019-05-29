//
//  ViewController.m
//  13_TableView2
//
//  Created by hongbo ni on 2019/5/21.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) NSArray *listTeams;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"team" ofType:@"plist"];
    NSLog(@" path is %@", path);
    
    self.listTeams = [[NSArray alloc] initWithContentsOfFile:path];
}

#pragma mark --data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.listTeams count];
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //cell
    NSString *cellIdentifier = @"CellIdntifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSLog(@" cell is %p", cell);
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    //    if (cell == nil) {
    //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    //    }
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor grayColor];
    //row
    NSUInteger row = [indexPath row];
    
    //label text
    NSDictionary *dic= self.listTeams[row];
    cell.textLabel.text = dic[@"name"];
    cell.detailTextLabel.text = dic[@"image"];
    
//    //    NSString *imagePath = [NSString stringWithFormat:@"%@.png", dic[@"image"]];
//    NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.png", dic[@"image"]];
//    NSLog(@"=====image path is %@, row is %lu", imagePath, (unsigned long)row);
//    //set image
//    cell.imageView.image = [UIImage imageNamed:@"pic/test.png"];
//    //    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}


@end

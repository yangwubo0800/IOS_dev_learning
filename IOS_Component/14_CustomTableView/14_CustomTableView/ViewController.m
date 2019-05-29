//
//  ViewController.m
//  14_CustomTableView
//
//  Created by hongbo ni on 2019/5/22.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>


#pragma mark 装载UITableView中的测试数据，显示在单元格中的标题
@property (strong, nonatomic) NSMutableArray *titles;

#pragma mark 装载UITableView中的测试数据，显示在单元格中的子标题
@property (strong, nonatomic) NSMutableArray *subtitles;


//@property (weak, nonatomic) IBOutlet UITableView *tableView;

#define identifier @"MyTableViewCell"


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
}


#pragma mark 加载测试数据
- (void)loadData {
    //初始化两个数组
    self.titles = [NSMutableArray array];
    self.subtitles = [NSMutableArray array];
    //给数组添加20条测试数据，用于显示到TableView上
    for(int i = 0; i < 20; i++) {
        [self.titles addObject:[NSString stringWithFormat:@"This is title %i", i]];
        [self.subtitles addObject:[NSString stringWithFormat:@"this is subtitle %i", i]];
    }
    //给UITableView设置代理和数据源
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
}


#pragma mark 该方法返回的是UITableView的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.titles count];
}
#pragma mark 该方法返回某一行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    
//    cell.textLabel.text = [self.titles objectAtIndex:indexPath.row];
//    cell.detailTextLabel.text = [self.subtitles objectAtIndex:indexPath.row];
    
    CustomTableViewCell *cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    
    cell.mainTitle.text = [self.titles objectAtIndex:indexPath.row];
    cell.subTitle.text = [self.subtitles objectAtIndex:indexPath.row];
    
//    cell.textLabel.text = @"text";
//    cell.detailTextLabel.text = @"detail";
    
    return cell;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    CustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
//    //在这里处理单元格中的图片和标签等控件
//    cell.imageView.image = [UIImage imageNamed:@"avatar.jpg"];
//    cell.mainTitle.text = [self.titles objectAtIndex:indexPath.row];
//    cell.subTitle.text = [self.subtitles objectAtIndex:indexPath.row];
//    return cell;
//}
#pragma mark 该方法返回单元格的高度，需要跟我们在Size inspector视图中设置的高度保持一致
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 78;
//}


@end

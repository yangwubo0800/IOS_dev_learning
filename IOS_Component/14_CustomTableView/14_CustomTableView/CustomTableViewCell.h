//
//  CustomTableViewCell.h
//  14_CustomTableView
//
//  Created by hongbo ni on 2019/5/22.
//  Copyright © 2019 hongbo ni. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface CustomTableViewCell : UITableViewCell
//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property (weak, nonatomic) IBOutlet UILabel *mainTitle;
//@property (weak, nonatomic) IBOutlet UILabel *subTitle;
//@property (weak, nonatomic) IBOutlet UIButton *Add;

@property (strong, nonatomic)  UILabel *mainTitle;
@property (strong, nonatomic)  UILabel *subTitle;

@end



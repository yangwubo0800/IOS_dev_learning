//
//  CustomTableViewCell.m
//  14_CustomTableView
//
//  Created by hongbo ni on 2019/5/22.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        CGFloat cellWidth = self.frame.size.width;
        CGFloat cellHeight = self.frame.size.height;
        
        CGFloat imageWidth = 50;
        CGFloat imageHeight = 40;
        CGFloat imageRightView = 30;
        
        self.mainTitle = [[UILabel alloc] initWithFrame:CGRectMake((cellWidth - (imageWidth+imageRightView)), (cellHeight - imageHeight)/2, imageWidth, imageHeight)];
        
        [self addSubview:self.mainTitle];
        
        CGFloat labelWidth = 100;
        CGFloat labelHeight = 20;
        CGFloat labelLeftView = 40;
        self.subTitle = [[UILabel alloc] initWithFrame:CGRectMake(labelLeftView, (cellHeight - labelHeight)/2, labelWidth, labelHeight)];
        
        [self addSubview:self.subTitle];
        
        
    }
    
    return self;
    
}


@end

//
//  EventCollectionViewCell.m
//  11_CollectionView
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "EventCollectionViewCell.h"
#import <UIKit/UIImageView.h>
#import <UIKit/UILabel.h>


@implementation EventCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat cellWidth = self.frame.size.width;
        CGFloat imageViewWidth = 101;
        CGFloat imageViewHeigth = 101;
        CGFloat imageViewTopview = 15;
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake((cellWidth - imageViewWidth)/2, imageViewTopview, imageViewWidth, imageViewHeigth)];
        [self addSubview:self.imageView];
        
        
        
        CGFloat labelWidth =101;
        CGFloat labelHeight = 16;
        CGFloat labelTopview = 120;
        self.label = [[UILabel alloc] initWithFrame:CGRectMake((cellWidth - labelWidth)/2, labelTopview, labelWidth, labelHeight)];
        
        self.label.font = [UIFont systemFontOfSize:13];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor greenColor];
        [self addSubview:self.label];
    }
    
    return self;
}

@end

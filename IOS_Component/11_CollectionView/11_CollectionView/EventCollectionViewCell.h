//
//  EventCollectionViewCell.h
//  11_CollectionView
//
//  Created by hongbo ni on 2019/5/15.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UICollectionViewCell.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EventCollectionViewCell :UICollectionViewCell

@property(strong, nonatomic) UIImageView *imageView;

@property(strong, nonatomic) UILabel *label;

@end

NS_ASSUME_NONNULL_END

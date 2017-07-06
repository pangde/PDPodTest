//
//  PDIndexView.h
//  PDCollectionViewIndex
//
//  Created by pangde on 17/7/4.
//  Copyright © 2017年 pangde. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PDIndexViewDelegate <NSObject>

- (void)collectionIndexPath:(NSIndexPath *)indexPath position:(UICollectionViewScrollPosition)position;

@end

@interface PDIndexView : UIView

@property (nonatomic,strong) NSArray *indexArray;

@property (nonatomic,weak) id<PDIndexViewDelegate> delegate;

@end

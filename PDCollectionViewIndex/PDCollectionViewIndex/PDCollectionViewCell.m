//
//  PDCollectionViewCell.m
//  PDCollectionViewIndex
//
//  Created by pangde on 17/7/4.
//  Copyright © 2017年 pangde. All rights reserved.
//

#import "PDCollectionViewCell.h"
#import "Masonry.h"

@implementation PDCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.bottom.equalTo(self.contentView);
    }];
}

@end

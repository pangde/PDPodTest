//
//  PDCollectionHeaderView.m
//  PDCollectionViewIndex
//
//  Created by pangde on 17/7/4.
//  Copyright © 2017年 pangde. All rights reserved.
//

#import "PDCollectionHeaderView.h"
#import "Masonry.h"

@implementation PDCollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupTitleLabel];
    }
    return self;
}

- (void)setupTitleLabel {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor blackColor];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.trailing.bottom.equalTo(self);
    }];
}

@end

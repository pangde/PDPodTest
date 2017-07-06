//
//  PDIndexView.m
//  PDCollectionViewIndex
//
//  Created by pangde on 17/7/4.
//  Copyright © 2017年 pangde. All rights reserved.
//

#import "PDIndexView.h"
#import "Masonry.h"
@interface PDIndexView ()

@property (nonatomic,strong) UILabel *indexLabel;

@end

@implementation PDIndexView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupIndexView];
    }
    return self;
}

- (void)setupIndexView {
    
    self.indexLabel = [[UILabel alloc] init];
    self.indexLabel.numberOfLines = 0;
    self.indexLabel.textAlignment = NSTextAlignmentCenter;
    self.indexLabel.textColor = [UIColor blackColor];
    [self addSubview:self.indexLabel];
    [self.indexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
}

- (void)setIndexArray:(NSArray *)indexArray {
    _indexArray = indexArray;
    
    NSString *indexStr = [indexArray componentsJoinedByString:@"\n"];
    self.indexLabel.text = indexStr;
    
}

// 触摸

- (void)setupTouchSection:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint  point = [touch locationInView:self];
    NSInteger section = point.y/20;
    NSIndexPath *indexP;
    if (section>=0 && section < self.indexArray.count) {
        indexP = [NSIndexPath indexPathForRow:0 inSection:section];
        [self.delegate collectionIndexPath:indexP position:UICollectionViewScrollPositionTop];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self setupTouchSection:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    [self setupTouchSection:event];
}





@end

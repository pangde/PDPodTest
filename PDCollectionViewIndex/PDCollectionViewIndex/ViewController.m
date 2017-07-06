//
//  ViewController.m
//  PDCollectionViewIndex
//
//  Created by pangde on 17/7/4.
//  Copyright © 2017年 pangde. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "PDCollectionViewCell.h"
#import "PDIndexView.h"
#import "PDCollectionHeaderView.h"

#define cellIdentifier @"PDCollectionViewCell"
#define headerIdentifier @"PDCollectionHeaderView"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,PDIndexViewDelegate>

@property (nonatomic,strong) UICollectionView *collection;
@property (nonatomic,strong) PDIndexView *indexView;
@property (nonatomic,strong) UILabel *indexLabel;
@property (nonatomic,strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.array = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupCollectionView];
    [self setupIndexView];
    
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc] init];
    fl.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*0.5-20, 100);
//    fl.sectionHeadersPinToVisibleBounds = YES;
    self.collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:fl];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    
    self.collection.backgroundColor = [UIColor whiteColor];
    [self.collection registerClass:[PDCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    [self.collection registerClass:[PDCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    [self.view addSubview:self.collection];
    
}

- (void)setupIndexView {
    self.indexView = [[PDIndexView alloc] init];
    self.indexView.delegate = self;
    [self.view addSubview:self.indexView];
    [self.indexView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.collection);
        make.width.equalTo(@15);
        make.height.mas_equalTo(self.array.count*20);
        make.trailing.equalTo(self.view);
    }];
    
    [self.collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.leading.bottom.equalTo(self.view);
        make.trailing.equalTo(self.indexView.mas_leading);
    }];
    self.indexView.indexArray = self.array;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PDCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        PDCollectionHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        header.titleLabel.text = self.array[indexPath.section];
        return header;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(collectionView.frame.size.width, 44);
}

// 索引
- (void)collectionIndexPath:(NSIndexPath *)indexPath position:(UICollectionViewScrollPosition)position {
    if (indexPath.section==self.array.count-1) {
        [self.collection selectItemAtIndexPath:indexPath animated:NO scrollPosition:position];
    } else {
        UICollectionViewLayoutAttributes *att = [self.collection.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        [self.collection setContentOffset:CGPointMake(self.collection.contentOffset.x, att.frame.origin.y)];
    }
    
    
}

@end

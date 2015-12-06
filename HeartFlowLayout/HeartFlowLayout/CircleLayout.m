//
//  CircleLayout.m
//  tabbarControllerAndNavigationController
//
//  Created by 梁坤 on 15/10/28.
//  Copyright (c) 2015年 lk. All rights reserved.
//

#import "CircleLayout.h"
#define ITEM_SIZE 20
@implementation CircleLayout
- (void)prepareLayout{
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    _cellcount = [[self collectionView]numberOfItemsInSection:0];
    _center = CGPointMake(size.width/2.0, size.height/2.0);
    _radius = MIN(size.width, size.height)/5.5;

}
- (CGSize)collectionViewContentSize{
    return CGSizeMake(self.collectionView.frame.size.width * 1.0 , self.collectionView.frame.size.height * 1.0);
}
- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *attributes = [NSMutableArray array];
    for (NSInteger i = 0 ; i < self.cellcount; i ++) {
        NSIndexPath *path = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:path]];
    }
    return attributes;
    
}

- (UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    CGFloat angle = 2 * M_PI * indexPath.item /_cellcount;
    attributes.center = CGPointMake(_center.x + _radius *(2*cos(angle) - cos(2 * angle)), _center.y + _radius * (2 * sin(angle)- sin(2 * angle)));

    return attributes;
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
@end

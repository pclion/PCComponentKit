//
//  PCCollectionViewLayout.m
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/25.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCCollectionViewLayout.h"

@implementation PCCollectionViewLayout

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
{
    self = [super init];
    if (self) {
        self.collectionView = collectionView;
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
    }
    return self;
}

- (void)registerCellNibName:(NSString *)nibName
{
    [self.collectionView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:[nibName reuseViewIdentifier]];
}
- (void)registerCellClassName:(NSString *)className
{
    [self.collectionView registerClass:NSClassFromString(className) forCellWithReuseIdentifier:[className reuseViewIdentifier]];
}

- (void)registerHeaderFooterViewNibName:(NSString *)nibName forSectionType:(PCSectionType)type
{
    NSString *kind = @"";
    if (type == PCSectionTypeHeader) {
        kind = UICollectionElementKindSectionHeader;
    } else if (type == PCSectionTypeFooter) {
        kind = UICollectionElementKindSectionFooter;
    }
    [self.collectionView registerNib:[UINib nibWithNibName:nibName bundle:nil] forSupplementaryViewOfKind:kind withReuseIdentifier:[nibName reuseViewIdentifier]];
}
- (void)registerHeaderFooterViewClassName:(NSString *)className forSectionType:(PCSectionType)type
{
    NSString *kind = @"";
    if (type == PCSectionTypeHeader) {
        kind = UICollectionElementKindSectionHeader;
    } else if (type == PCSectionTypeFooter) {
        kind = UICollectionElementKindSectionFooter;
    }
    [self.collectionView registerClass:NSClassFromString(className) forSupplementaryViewOfKind:kind withReuseIdentifier:[className reuseViewIdentifier]];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    PCSectionInfo *sectionInfo = self.dataArray[section];
    return sectionInfo.cellInfoArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PCSectionInfo *sectionInfo = self.dataArray[indexPath.section];
    PCCellInfo *cellInfo = sectionInfo.cellInfoArray[indexPath.row];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[cellInfo cellIdentifer] forIndexPath:indexPath];
    if (self.cellConfigure) {
        self.cellConfigure(cell, indexPath, cellInfo);
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    PCSectionInfo *sectionInfo = self.dataArray[indexPath.section];
    UICollectionReusableView *reuseView = nil;
    if (sectionInfo.headerClassName) {
        reuseView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[sectionInfo headerIdentifer] forIndexPath:indexPath];
    }
    if (self.headerFooterConfigure) {
        PCSectionType type = PCSectionTypeHeader;
        if (kind == UICollectionElementKindSectionHeader) {
            type = PCSectionTypeHeader;
        } else if (kind == UICollectionElementKindSectionFooter) {
            type = PCSectionTypeFooter;
        }
        self.headerFooterConfigure(reuseView, type, [NSIndexPath indexPathForItem:0 inSection:indexPath.section],sectionInfo);
    }
    return reuseView;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PCSectionInfo *sectionInfo = self.dataArray[indexPath.section];
    PCCellInfo *cellInfo = sectionInfo.cellInfoArray[indexPath.row];
    return cellInfo.itemSize;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    PCSectionInfo *sectionInfo = self.dataArray[section];
    return sectionInfo.sectionFooterSize;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    PCSectionInfo *sectionInfo = self.dataArray[section];
    return sectionInfo.sectionHeaderSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return self.insetsForSection;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    PCSectionInfo *sectionInfo = self.dataArray[section];
    return sectionInfo.minimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    PCSectionInfo *sectionInfo = self.dataArray[section];
    return sectionInfo.minimumInteritemSpacing;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PCSectionInfo *sectionInfo = self.dataArray[indexPath.section];
    PCCellInfo *cellInfo = sectionInfo.cellInfoArray[indexPath.row];
    if (self.didSelected) {
        self.didSelected(indexPath,cellInfo);
    }
}

#pragma mark - UICollectionViewDataSourcePrefetching

- (void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
    
}

@end

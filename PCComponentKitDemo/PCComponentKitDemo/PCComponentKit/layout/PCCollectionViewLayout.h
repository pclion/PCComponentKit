//
//  PCCollectionViewLayout.h
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/25.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCListLayout.h"
#import "PCSectionInfo.h"

@interface PCCollectionViewLayout : PCListLayout<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching>

@property (nonatomic, weak) UICollectionView *collectionView;//绑定的collectionView

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;

@property (nonatomic) UIEdgeInsets insetsForSection;

//注册cell
- (void)registerCellNibName:(NSString *)nibName;
- (void)registerCellClassName:(NSString *)className;

//注册headerfooterview
- (void)registerHeaderFooterViewNibName:(NSString *)nibName forSectionType:(PCSectionType)type;
- (void)registerHeaderFooterViewClassName:(NSString *)className forSectionType:(PCSectionType)type;

@end

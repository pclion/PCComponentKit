//
//  PCListLayout.h
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/25.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCBaseLayout.h"
#import "PCSectionInfo.h"

typedef enum : NSUInteger {
    PCSectionTypeHeader,    //section 头部
    PCSectionTypeFooter,    //section 底部
} PCSectionType;

typedef void(^ConfigureData)(UIView *cell, NSIndexPath *indexpath, PCCellInfo *cellInfo);
typedef void(^SectionConfigure)(UIView *sectionView, PCSectionType type, NSIndexPath *indexpath, PCSectionInfo *sectionInfo);
typedef void(^CellDidSelected)(NSIndexPath *indexpath, PCCellInfo *cellInfo);

@interface PCListLayout : PCBaseLayout

@property (nonatomic, strong) NSArray<PCSectionInfo *> *dataArray;//数据源
@property (nonatomic, copy) ConfigureData cellConfigure;//cell配置block
@property (nonatomic, copy) CellDidSelected didSelected;//cell选中block
@property (nonatomic, copy) SectionConfigure headerFooterConfigure;//sectionHeader配置block

@end

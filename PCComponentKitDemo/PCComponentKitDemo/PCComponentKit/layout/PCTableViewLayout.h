//
//  PCTableViewLayout.h
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/17.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCBaseLayout.h"
#import "PCSectionInfo.h"

@class PCTableViewLayout;

typedef void(^ConfigureData)(UITableViewCell *cell, NSIndexPath *indexpath, PCCellInfo *cellInfo);
typedef void(^SectionConfigure)(UIView *view, NSIndexPath *indexpath, PCSectionInfo *sectionInfo);
typedef void(^CellDidSelected)(PCTableViewLayout *layout, NSIndexPath *indexpath, PCCellInfo *cellInfo);

@interface PCTableViewLayout : PCBaseLayout<UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching>

- (instancetype)initWithTableView:(UITableView *)tableView;

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) UIView *easyHeaderView;
@property (nonatomic, strong) UIView *easyFooterView;

@property (nonatomic, strong) NSArray<PCSectionInfo *> *dataArray;
@property (nonatomic, copy) ConfigureData cellConfigure;
@property (nonatomic, copy) CellDidSelected didSelected;
@property (nonatomic, copy) SectionConfigure headerConfigure;
@property (nonatomic, copy) SectionConfigure footerConfigure;

- (void)registerCellNibName:(NSString *)nibName;
- (void)registerCellClassName:(NSString *)className;

- (void)registerHeaderFooterViewNibName:(NSString *)nibName;
- (void)registerHeaderFooterViewClassName:(NSString *)className;

@end

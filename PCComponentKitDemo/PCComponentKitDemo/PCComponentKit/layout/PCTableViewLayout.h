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

/*
 tableview回调封装类
 */
@interface PCTableViewLayout : PCBaseLayout<UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching>

- (instancetype)initWithTableView:(UITableView *)tableView;

@property (nonatomic, weak) UITableView *tableView;//绑定的tableview

@property (nonatomic, strong) NSArray<PCSectionInfo *> *dataArray;//数据源
@property (nonatomic, copy) ConfigureData cellConfigure;//cell配置block
@property (nonatomic, copy) CellDidSelected didSelected;//cell选中block
@property (nonatomic, copy) SectionConfigure headerConfigure;//sectionHeader配置block
@property (nonatomic, copy) SectionConfigure footerConfigure;//sectionFooter配置block

//注册cell
- (void)registerCellNibName:(NSString *)nibName;
- (void)registerCellClassName:(NSString *)className;

//注册headerfooterview
- (void)registerHeaderFooterViewNibName:(NSString *)nibName;
- (void)registerHeaderFooterViewClassName:(NSString *)className;

@end

//
//  PCTableViewLayout.m
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/17.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCTableViewLayout.h"
#import "NSString+ReuseIdentifer.h"

@implementation PCTableViewLayout

- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        self.tableView = tableView;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }
    return self;
}

- (void)registerCellNibName:(NSString *)nibName
{
    [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:[nibName reuseViewIdentifier]];
}
- (void)registerCellClassName:(NSString *)className
{
    [self.tableView registerClass:NSClassFromString(className) forCellReuseIdentifier:[className reuseViewIdentifier]];
}

- (void)registerHeaderFooterViewNibName:(NSString *)nibName
{
    [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:nil] forHeaderFooterViewReuseIdentifier:[nibName reuseViewIdentifier]];
}
- (void)registerHeaderFooterViewClassName:(NSString *)className
{
    [self.tableView registerClass:NSClassFromString(className) forHeaderFooterViewReuseIdentifier:[className reuseViewIdentifier]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    PCSectionInfo *sectionInfo = self.dataArray[section];
    return sectionInfo.cellInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PCSectionInfo *sectionInfo = self.dataArray[indexPath.section];
    PCCellInfo *cellInfo = sectionInfo.cellInfoArray[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[cellInfo cellIdentifer] forIndexPath:indexPath];
    if (self.cellConfigure) {
        self.cellConfigure(cell, indexPath, cellInfo);
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    PCSectionInfo *sectionInfo = self.dataArray[section];
    return sectionInfo.sectionHeaderSize.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    PCSectionInfo *sectionInfo = self.dataArray[section];
    return sectionInfo.sectionFooterSize.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PCSectionInfo *sectionInfo = self.dataArray[indexPath.section];
    PCCellInfo *cellInfo = sectionInfo.cellInfoArray[indexPath.row];
    return cellInfo.itemSize.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = nil;
    PCSectionInfo *sectionInfo = self.dataArray[section];
    if (sectionInfo.headerClassName) {
        header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[sectionInfo headerIdentifer]];
    } else if (self.easyHeaderView) {
        header = self.easyHeaderView;
    }
    if (self.headerConfigure) {
        self.headerConfigure(header,[NSIndexPath indexPathForRow:0 inSection:section],sectionInfo);
    }
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footer = nil;
    PCSectionInfo *sectionInfo = self.dataArray[section];
    if (sectionInfo.footerClassName) {
        footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[sectionInfo footerIdentifer]];
    } else if (self.easyFooterView) {
        footer = self.easyFooterView;
    }
    if (self.footerConfigure) {
        self.footerConfigure(footer,[NSIndexPath indexPathForRow:0 inSection:section],sectionInfo);
    }
    return footer;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PCSectionInfo *sectionInfo = self.dataArray[indexPath.section];
    PCCellInfo *cellInfo = sectionInfo.cellInfoArray[indexPath.row];
    if (self.didSelected) {
        self.didSelected(self,indexPath,cellInfo);
    }
}

#pragma mark - UITableViewDataSourcePrefetching

- (void)tableView:(UITableView *)tableView prefetchRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
    
}

@end

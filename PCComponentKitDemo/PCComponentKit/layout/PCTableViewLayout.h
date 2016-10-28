//
//  PCTableViewLayout.h
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/17.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCListLayout.h"
#import "PCSectionInfo.h"

/*
 tableview回调封装类
 */
@interface PCTableViewLayout : PCListLayout<UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching>

- (instancetype)initWithTableView:(UITableView *)tableView;

@property (nonatomic, weak) UITableView *tableView;//绑定的tableview

//注册cell
- (void)registerCellNibName:(NSString *)nibName;
- (void)registerCellClassName:(NSString *)className;

//注册headerfooterview
- (void)registerHeaderFooterViewNibName:(NSString *)nibName;
- (void)registerHeaderFooterViewClassName:(NSString *)className;

@end

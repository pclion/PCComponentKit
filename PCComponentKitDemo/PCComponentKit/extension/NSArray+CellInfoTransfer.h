//
//  NSArray+CellInfoTransfer.h
//  LSTComponentKit
//
//  Created by peichuang on 16/10/14.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCSectionInfo.h"
#import "PCCellInfo.h"

/*
 转化数据为sectioninfo和cellinfo类
 */
@interface NSArray (CellInfoTransfer)

- (NSArray *)enumerateObjectsToSectionInfoUsingBlock:(void(^)(id obj, NSInteger idx, PCSectionInfo *sectionInfo))sectionBlock;

- (NSArray *)enumerateObjectsToCellInfoUsingBlock:(void(^)(id obj, NSInteger idx, PCCellInfo *cellInfo))cellBlock;

@end

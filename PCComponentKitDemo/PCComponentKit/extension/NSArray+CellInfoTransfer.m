//
//  NSArray+CellInfoTransfer.m
//  LSTComponentKit
//
//  Created by peichuang on 16/10/14.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "NSArray+CellInfoTransfer.h"

@implementation NSArray (CellInfoTransfer)

- (NSArray *)enumerateObjectsToSectionInfoUsingBlock:(void (^)(id, NSInteger, PCSectionInfo *))sectionBlock
{
    NSMutableArray *resultArray = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        PCSectionInfo *sectionInfo = [[PCSectionInfo alloc] init];
        if (sectionBlock) {
            sectionBlock(obj,idx,sectionInfo);
        }
        [resultArray addObject:sectionInfo];
    }];
    
    return [resultArray copy];
}

- (NSArray *)enumerateObjectsToCellInfoUsingBlock:(void (^)(id, NSInteger, PCCellInfo *))cellBlock
{
    NSMutableArray *resultArray = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        PCCellInfo *cellInfo = [[PCCellInfo alloc] init];
        if (cellBlock) {
            cellBlock(obj,idx,cellInfo);
        }
        [resultArray addObject:cellInfo];
    }];
    
    return [resultArray copy];
}

@end
